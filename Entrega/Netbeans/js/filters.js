$(function(){
    let $selectRace = $("select[name='race']").first();
    $("select[name='especie").change(function(e){
        const specieId = $(this).val();
        
        //cargar con ajax la raza
        $.ajax({
            url: "species.php?specie="+specieId,
            type: "GET",
            data: "",
            dataType: "json",
            success: function(data){
                
                let options = ['<option value="" disabled="" selected="">Raza</option>'];
                for (let i = 0; i < data.length ; i++){
                    const idRaza = data[i].id;                
                    const nomRaza = data[i].nombre;
                    
                    options.push("<option value="+idRaza+">"+nomRaza+"</option>");
                }
                $selectRace.empty();
                //cargar un select
                options.forEach(function(op){
                    $selectRace.append(op);
                });
                
            },
            fail: function(error){
                console.log(error);
            }
        });
    });

});


