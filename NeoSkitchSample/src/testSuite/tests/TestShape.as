package testSuite.tests
{
	import flexunit.framework.Assert;
	
	import local.malik.skitch.view.drawing.interfaces.IShape;
	import local.malik.skitch.view.drawing.shapes.Rectangle;
	
	import org.flexunit.asserts.assertEquals;
	
	public class TestShape
	{		
		private var rectangle:IShape;
		[Before]
		public function setUp():void
		{
			rectangle = new Rectangle();
		}
		
		[After]
		public function tearDown():void
		{
			rectangle = null;
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

			rectangle.FromXML( x );
			
			assertEquals( 100, rectangle.x );
			assertEquals( 100, rectangle.y );
			assertEquals( 200, rectangle.height );
			assertEquals( 200, rectangle.width );
			assertEquals( 0xff0000, rectangle.fillColor );
		}
		
		[Test]
		public function testToXML():void
		{
			rectangle.height = 10;
			rectangle.width = 10;
			rectangle.x = 1;
			rectangle.y = 2;
			
			var x:XML = rectangle.ToXML();
			
			assertEquals( x.@fillColor, rectangle.fillColor );
			assertEquals( x.@height, rectangle.height );
			assertEquals( 10, x.@width );
			assertEquals( 1, x.@x );
			assertEquals( 2, x.@y );

		}
	}
}