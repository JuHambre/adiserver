/**
 * Created with JetBrains RubyMine.
 * User: adi
 * Date: 16/11/13
 * Time: 17:35
 * To change this template use File | Settings | File Templates.
 */
var ColActualizacionView = Backbone.View.extend({
    el: '#divActualizacion',
    initialize: function() {
        this.collection.on('remove sync', this.render, this)
    },
    render: function(){
        this.$el.html("<h2>Actualizaciones</h2>")
        var $el = this.$el;
        this.collection.forEach(function(actualizacion){
            var act = new ActualizacionView({model:actualizacion});
            $el.append(act.render().el);
        })
        //$el.html($el.html() + ($('#divBotonCrearActualizacion').html())); //Linea infernal no funciona
        $el.append($('#divBotonCrearActualizacion').html())
    },
    events: {
        "click #botonCrearActualizacion" : "crearActualizacion"
    },
    crearActualizacion:function(){

        var json={
            contenido : $('#comentarioActualizacion').val()
        }
        var actualizacion = new Actualizacion(json)
        this.collection.add(actualizacion);
        actualizacion.save();
    }
})