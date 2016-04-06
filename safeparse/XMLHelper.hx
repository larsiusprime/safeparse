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

class XMLHelper
{

	/**
	 * Safety wrapper for reading a string attribute from xml
	 * @param	Data the Xml object
	 * @param	Att the name of the attribute
	 * @param	ForceLowerCase whether to force it to be lower case
	 * @param	Default what to return if the value doesn't exist
	 * @return
	 */
	
	public static function getStr(Data:Xml, Att:String, ForceLowerCase:Bool = false, Default:String = ""):String
	{
		if (data.get(att) != null)
		{
			if (ForceLowerCase)
			{
				return data.get(Att).toLowerCase();
			}
			else
			{
				return data.get(Att);
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
	
	public static function getFloat(data:Xml, Att:String, Default:Float = 0):Float
	{
		if (data.get(Att) != null)
		{
			return Std.parseFloat(data.get(Att));
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
		if (data.get(att) != null)
		{
			return Std.parseInt(data.get(att));
		}
		return default_;
	}
	
	/**
	 * Safety wrapper for reading a bool attribute from xml
	 * @param	data the Xml object
	 * @param	att the name of the attribute
	 * @param   what to return if the value doesn't exist
	 * @return  true if att is "true" (case-insensitive) or "1", otherwise false
	 */
	
	public static function getBool(Data:Xml, Att:String, Default:Bool = false):Bool
	{
		if (data.get(att) != null)
		{
			var str:String = data.get(att);
			str = str.toLowerCase();
			if (str == "true" || str == "1") {		//only "true" or "1" return TRUE
				return true;
			}
			return false;							//any other value returns FALSE
		}
		return default_;							//if the attribute does not EXIST, return the DEFAULT VALUE
	}
	
}