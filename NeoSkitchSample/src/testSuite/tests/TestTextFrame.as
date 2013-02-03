package testSuite.tests
{
	import local.malik.skitch.view.drawing.text.TextFrame;
	
	import org.flexunit.asserts.assertEquals;

	public class TestTextFrame
	{
		private var textFrame:TextFrame;
		
		[Before]
		public function setUp():void
		{
			textFrame = new TextFrame();
		}
		
		[After]
		public function tearDown():void
		{
			textFrame = null;
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
			var x:XML = <Text borderAlpha="1" borderColor="0" borderWeight="1" fillAlpha="1" fillColor="0xff0000" 
							height="200" width="200" x="100" y="100">some test text</Text>
			
			textFrame.FromXML( x );
			
			assertEquals( 100, textFrame.x );
			assertEquals( 100, textFrame.y );
			assertEquals( 200, textFrame.height );
			assertEquals( 200, textFrame.width );
			assertEquals( 0xff0000, textFrame.fillColor );
			assertEquals( "some test text", textFrame.text )
		}
		
		[Test]
		public function testToXML():void
		{
			textFrame.height = 10;
			textFrame.width = 10;
			textFrame.x = 1;
			textFrame.y = 2;
			textFrame.text = "some test text";
			
			var x:XML = textFrame.ToXML();
			
			assertEquals( x.@fillColor, textFrame.fillColor );
			assertEquals( x.@height, textFrame.height );
			assertEquals( 10, x.@width );
			assertEquals( 1, x.@x );
			assertEquals( 2, x.@y );
			
		}
	}
}