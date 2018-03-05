function scrollFilters() {
    const offset = 0; // lo usamos depsues de que pasa el header
    const element = document.getElementById('filters');
    const yOffset = window.pageYOffset;
 
    if (yOffset > 160 && yOffset < 1400) {// altura del header
        let pixels = parseInt((window.pageYOffset + offset)) 
        element.style.top = pixels+ 'px';
        
    }
    else element.style.top = '160px';
}

window.setInterval(scrollFilters, 0);