/**
 * Created with JetBrains RubyMine.
 * User: adi
 * Date: 16/11/13
 * Time: 15:30
 * To change this template use File | Settings | File Templates.
 */
var Actualizaciones = Backbone.Collection.extend({
    model: Actualizacion,
    url:'api/peticiones/'+id_peticion+'/actualizaciones'
});