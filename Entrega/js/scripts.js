
$(document).ready(function() {
    $('p.description').each(function(){
        let $this = $(this)
        const text = $this.text()
        $this.text(text.substr(0,150)+'...')
        $this.prev().css('margin-bottom',0)
    }   
)})

