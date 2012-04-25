package io;

import haxe.xml.Fast;
import models.Resource;

class BehaviorReader
{
	public function new() 
	{
	}		

	public static function readBehavior(xml:Fast):Behavior
	{
		var elementID:Int = Std.parseInt(xml.att.id);
		var name:String = xml.att.name;
		var classname:String = xml.att.class;
		var attributes:Array<Attribute> = new Array<Attribute>();
	
		for(e in xml.elements)
		{
			var type:String = e.name;
			
			if(type == "snippets")
			{
				//Sub-Snippets - Ignore
			}
			
			else if(type == "blocks")
			{
				//Custom Blocks - Ignore for engine
			}
			
			else if(type == "events")
			{
				//Events - Ignore for engine
			}
			
			//Attributes
			else
			{
				attributes[Std.parseInt(e.att.id)] = readAttribute(e);	
			}
		}
		
		var b:Behavior = new Behavior
		(
			null,
			null,
			elementID,
			name,
			classname, 
			true,
			true,
			true,
			attributes
		);

		return b;
	}
	
	public static function readAttribute(xml:XML):Attribute
	{
		var ID:Number = Std.parseInt(xml.att.id);
		var fieldName:String = xml.att.name;
		var fullName:String = xml.att.fullname;
		var defaultValue:String = xml.att.default;
		var type:String = xml.name;
		
		return new Attribute(ID, fieldName, fullName, defaultValue, type, null);
	}
}