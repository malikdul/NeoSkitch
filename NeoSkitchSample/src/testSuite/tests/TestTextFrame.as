package testSuite.tests
{
	import local.malik.skitch.view.drawing.text.TextFrame;
	
	import org.flexunit.asserts.assertEquals;

	public class TestTextFrame
	{
		private var text:TextFrame;
		
		[Before]
		public function setUp():void
		{
			text = new TextFrame();
		}
		
		[After]
		public function tearDown():void
		{
			text = null;
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testFromXML():void
		{
			var x:XML = <Elipse borderAlpha="1" borderColor="0" borderWeight="1" fillAlpha="1" fillColor="0xff0000" 
							height="200" width="200" x="100" y="100"/>;
			
			text.FromXML( x );
			
			assertEquals( 100, text.x );
			assertEquals( 100, text.y );
			assertEquals( 200, text.height );
			assertEquals( 200, text.width );
			assertEquals( 0xff0000, text.fillColor );
		}
		
		[Test]
		public function testToXML():void
		{
			text.height = 10;
			text.width = 10;
			text.x = 1;
			text.y = 2;
			
			var x:XML = text.ToXML();
			
			assertEquals( x.@fillColor, text.fillColor );
			assertEquals( x.@height, text.height );
			assertEquals( 10, x.@width );
			assertEquals( 1, x.@x );
			assertEquals( 2, x.@y );
			
		}
	}
}