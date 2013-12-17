/**
 * Created with JetBrains RubyMine.
 * User: adi
 * Date: 23/11/13
 * Time: 20:06
 * To change this template use File | Settings | File Templates.
 */

var UsuarioView = Backbone.View.extend({
    formulario: Mustache.compile($('#viewEditarUsuario').html()),
    initialize: function() {
        this.model.on('change', this.render, this)
    },
    render: function(){
        this.$el.html(this.formulario(this.model.toJSON()));
        $('#overEditarUsuario').append(this.el);
        return this;
    },
    events: {
        "click .botonEditarUsuario" : "editarUsuario"
    },
    editarUsuario:function(){
        var json={
            login: this.model.get('login'),
            nombre:this.$el.find('#nombreEditarUsuario').val(),
            apellidos: this.$el.find('#apellidosEditarUsuario').val()
        }
        var oldPassword = this.$el.find('#oldEditarUsuario').val();
        var newPassword = this.$el.find('#newEditarUsuario').val();
        if(oldPassword != '' && newPassword != ''){
            json.oldPassword = oldPassword;
            json.newPassword = newPassword;
        }
        this.model.attributes = json;
        this.model.save();
        hideLightboxEditarUsuario();
    }
})