package luxe.collision;

import luxe.collision.ShapeDrawer;
import luxe.collision.shapes.Circle;
import luxe.Vector;
import luxe.Log.*;

import luxe.options.RenderProperties;

class ShapeDrawerLuxe extends ShapeDrawer {

    static var color = new luxe.Color().rgb(0xf6007b); //0xff4b03

    var options : RenderProperties;

    public function new( ?_options:RenderProperties ) {

        super();
        options = _options;

        if(options == null) options = {};
        if(options.immediate == null) options.immediate = true;
        if(options.depth == null) options.depth = 100;

    }

    override public function drawCircle( circle:Circle ) {

        assertnull(circle);

        var smoothVal = 10.0;
        if (circle.transformedRadius < 2.0 ) {
            smoothVal = 20.0;
        }

        Luxe.draw.ring({
            x: circle.position.x,
            y: circle.position.y,
            r: circle.transformedRadius,
            color: color,
            depth: options.depth,
            group: options.group,
            immediate: options.immediate,
            batcher: options.batcher,
            smooth: smoothVal
        });

    }

    override public function drawLine( p0:Vector, p1:Vector, ?startPoint:Bool = true ) {

        assertnull(p0);
        assertnull(p1);

        Luxe.draw.line({
            p0 : new luxe.Vector(p0.x, p0.y),
            p1 : new luxe.Vector(p1.x, p1.y),
            color : color,
            depth: options.depth,
            group: options.group,
            immediate: options.immediate,
            batcher: options.batcher
        });

    } //drawLine

} //ShapeDrawerLuxe
