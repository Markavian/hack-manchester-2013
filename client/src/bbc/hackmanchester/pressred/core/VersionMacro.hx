package bbc.hackmanchester.pressred.core;

#if macro
import sys.io.File;
#end
import haxe.macro.Expr;
import haxe.macro.Context;
 
class VersionMacro
{
    macro public static function getAppVersion(projectFileName:String):Expr
    {
        var xml = Xml.parse(File.getContent("./" + projectFileName));
        var fast = new haxe.xml.Fast(xml.firstElement());
 
        return Context.makeExpr(fast.node.meta.att.version, Context.currentPos());
    }
}