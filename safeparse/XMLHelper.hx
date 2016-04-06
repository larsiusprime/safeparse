/**
 * Copyright (c) 2016 Level Up Labs, LLC
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 */

package safeparse;
import safeparse.XMLHelper.TextCase;

class XMLHelper
{

	/**
	 * Safety wrapper for reading a string attribute from xml
	 * @param	Data the Xml object
	 * @param	Att the name of the attribute
	 * @param	Default what to return if the value doesn't exist
	 * @param	ForceLowerCase whether to force it to be lower case
	 * @return
	 */
	
	public static function getStr(Data:Xml, Att:String, Default:String = "", ForceCase:TextCase = NONE):String
	{
		if (Data.get(att) != null)
		{
			var str:String = Data.get(Att);
			return switch(ForceCase)
			{
				case UPPER: str.toUpperCase();
				case LOWER: str.toLowerCase();
				default: str;
			}
		}
		return Default;
	}
	
	/**
	 * Safety wrapper for reading a float attribute from xml
	 * @param	Data the Xml object
	 * @param	Att the name of the attribute
	 * @param	Default what to return if the value doesn't exist
	 * @return
	 */
	
	public static function getFloat(Data:Xml, Att:String, Default:Float = 0):Float
	{
		if (Data.get(Att) != null)
		{
			return Std.parseFloat(Data.get(Att));
		}
		return Default;
	}
	
	/**
	 * Safety wrapper for reading an int attribute from xml
	 * @param	Data the Xml object
	 * @param	Att the name of the attribute
	 * @param	Default what to return if the value doesn't exist
	 * @return
	 */
	
	public static function getInt(Data:Xml, Att:String, Default:Int = 0):Int
	{
		if (Data.get(att) != null)
		{
			return Std.parseInt(Data.get(att));
		}
		return Default;
	}
	
	/**
	 * Safety wrapper for reading a bool attribute from xml
	 * @param	Data the Xml object
	 * @param	Att the name of the attribute
	 * @param   Default what to return if the value doesn't exist
	 * @return  true if att is "true" (case-insensitive) or "1", otherwise false
	 */
	
	public static function getBool(Data:Xml, Att:String, Default:Bool = false):Bool
	{
		if (Data.get(att) != null)
		{
			var str:String = Data.get(att);
			str = str.toLowerCase();
			if (str == "true" || str == "1")		//only "true" or "1" return TRUE
			{
				return true;
			}
			return false;							//any other value returns FALSE
		}
		return Default;								//if the attribute does not EXIST, return the DEFAULT VALUE
	}
	
	enum TextCase
	{
		UPPER;
		LOWER;
		NONE;
	}
}