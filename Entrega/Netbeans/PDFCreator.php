<?php

require_once('libs/fpdf/fpdf.php');
require_once 'datos.php';

class PDF extends FPDF {

    function getDatosPublicacion($pubId) {
        $sql = 'SELECT
p.id,
p.titulo,
(
    CASE p.exitoso
    WHEN 0 THEN  "Sin exito"
    WHEN 1 THEN  "Exitoso"
    ELSE "No cerrado"
    END
) as estado,
p.tipo,
e.nombre as especie,
r.nombre as raza,
b.nombre as barrio,
CASE p.abierto
WHEN 1 THEN "Abierto"
WHEN 0 THEN "Cerrado"
END as abierto,
u.nombre,
u.email,
u.id as idUsuario,
p.latitud,
p.longitud

FROM `publicaciones` p
INNER JOIN `razas` r
ON p.raza_id = r.id
INNER JOIN `barrios` b
ON b.id = barrio_id
INNER JOIN `especies` e
ON e.id = p.especie_id
INNER JOIN `usuarios` u
ON p.usuario_id = u.id
WHERE p.id=:pid';

        $param = [["pid", $pubId, "int"]];
        $con = getConexion();
        $con->consulta($sql, $param);
        $pub = $con->restantesRegistros();
        $pub = $pub[0];
        $con->desconectar();
        return $pub;
    }

    function getFotos($pubId) {
        $fotos = [];
        $dir = "imgs/{$pubId}/";

        if (!is_dir($dir))
            return $fotos;

        if ($handle = opendir($dir)) {
            while (false !== ($entry = readdir($handle))) {
                if ($entry != "." && $entry != "..") {
                    $fotos[] = $dir . $entry;
                }
            }
            closedir($handle);
        }

        return $fotos;
    }

    function Header() {
        global $title;

        // Arial bold 15
        $this->SetFont('Arial', 'B', 15);
        // Calculate width of title and position
        $w = $this->GetStringWidth($title) + 6;
        $this->SetX((210 - $w) / 2);
        // Colors of frame, background and text
        $this->SetDrawColor(0, 80, 180);
        $this->SetFillColor(162, 168, 189);
        $this->SetTextColor(220, 50, 50);
        // Thickness of frame (1 mm)
        $this->SetLineWidth(1);
        // Title
        $this->Cell($w, 9, $title, 1, 1, 'C', true);
        // Line break
        $this->Ln(10);
    }

    function Footer() {
        // Position at 1.5 cm from bottom
        $this->SetY(-15);
        // Arial italic 8
        $this->SetFont('Arial', 'I', 8);
        // Text color in gray
        $this->SetTextColor(128);
        // Page number
        $this->Cell(0, 10, 'Page ' . $this->PageNo(), 0, 0, 'C');
    }

    function ChapterTitle($title) {
        // Arial 12
        $this->SetFont('Arial', '', 12);
        // Background color
        $this->SetFillColor(200, 220, 255);
        // Title
        $this->Cell(0, 6, $title, 0, 1, 'L', true);
        // Line break
        $this->Ln(4);
    }

    function ChapterBody($content) {

        $content = utf8_decode($content);
        // Times 12
        $this->SetFont('Times', '', 12);
        // Output justified text
        $this->MultiCell(0, 5, $content);
        // Line break
        $this->Ln();
        // Mention in italics
        $this->SetFont('', 'I');
        $this->Cell(0, 5);
        $this->Ln(4);
    }

    function PrintChapter($title, $content) {

        $this->ChapterTitle($title);
        $this->ChapterBody($content);
    }

}

$pubId = $_GET["pubId"];
$pdf = new PDF();
$pub = $pdf->getDatosPublicacion($pubId);
$title = 'MASCOTAS SIN HOGAR';
$pdf->AddPage();
$pdf->SetTitle($title);

$pdf->PrintChapter('TITULO', $pub["titulo"]);
$pdf->PrintChapter('ESTADO ACTUAL', $pub["estado"]);
$pdf->PrintChapter('TIPO', $pub["tipo"] == 'E' ? 'Encontrado' : 'Perdido');
$pdf->PrintChapter('ESPECIE', $pub["especie"]);
$pdf->PrintChapter('RAZA', $pub["raza"]);
$pdf->PrintChapter('BARRIO', $pub["barrio"]);
$pdf->PrintChapter('ABIERTO', $pub["abierto"]);
$pdf->PrintChapter('REPORTADO POR', $pub["nombre"]);
$pdf->PrintChapter('CONTACTO', $pub["email"]);

//Buscamos la foto
$images = $pdf->getFotos($pubId);
if (count($images) > 0) {
    $pdf->AddPage();
    $pdf->ChapterTitle("FOTOS");


    foreach ($images as $image) {
        $pdf->Cell(40, 40, $pdf->Image($image, $pdf->GetX(), $pdf->GetY(), 33.78), 0, 0, 'L', false);
        $pdf->Ln();
    }
}
$pdf->Output();
