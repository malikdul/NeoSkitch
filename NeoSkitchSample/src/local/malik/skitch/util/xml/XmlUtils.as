/*

Copyright (c) 2013 malikdul ( malikdul@gmail.com )
Licensed under the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

For more information see COPYING.txt file in the root folder


**/
package local.malik.skitch.util.xml
{
	public class XmlUtils
	{
		public static function getNodeByTagName(tagName:String):XML
		{
			return new XML(  "<" + tagName + "/>" );
		}
		
	}
}