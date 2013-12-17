/**
 * Created with JetBrains RubyMine.
 * User: adi
 * Date: 16/11/13
 * Time: 13:11
 * To change this template use File | Settings | File Templates.
 */
var FirmaView = Backbone.View.extend({
    formulario: $('#viewFirma').html(),
    render: function(){
        this.$el.html(this.formulario)
        $('#divFirma').append(this.el)
        return this;
    },
    events: {
        "click #botonFirma" : "crearFirma"
    },
    crearFirma:function(){
        var json={
            publica:    this.$el.find('#publicaFirma').prop('checked'),
            comentario: this.$el.find('#comentarioFirma').val()
        }
        if(!localStorage.login){
            json.nombre = this.$el.find('#nombreFirma').val();
            json.apellidos = this.$el.find('#apellidosFirma').val();
            json.email = this.$el.find('#emailFirma').val();
        }
        var firma = new Firma(json)
        firma.save();
    }
})