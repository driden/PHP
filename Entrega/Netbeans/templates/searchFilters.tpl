<div id="filters">
        <div id="mainFilterTitle">
            <span class="banner large azul">Filtros de Búsqueda</span>
        </div>
        <div id="innerFiltersDiv">
            <form action="/action_page.php">
                <div>
                    <select name="pubType" form="filters">
                        <option value="" disabled selected>Tipo de publicación</option>
                        <option value="found">Encontrada</option>
                        <option value="lost">Perdida</option>
                    </select>
                </div>
                <br></br>
                <div>
                    <select name="especie" form="filters">
                        <option value="" disabled selected>Especie</option>
                        {foreach from=$especies item=especie}
                         <option value="{$especie.id}">{$especie.nombre}</option>  
                        {/foreach}
                    </select>
                </div>
                <br></br>
                <div>
                    <select name="race" form="filters">
                        <option value="" disabled selected>Raza</option>


                    </select>
                </div>
                <br></br>
                <div>
                    <select name="neighbourhood" form="filters">
                        <option value="" disabled selected>Barrio</option>
                        {foreach from=$barrios item=barrio}
                         <option value="{$barrio.id}">{$barrio.nombre}</option>  
                        {/foreach}
                    </select>
                </div>
            </form>
        </div>
    </div>