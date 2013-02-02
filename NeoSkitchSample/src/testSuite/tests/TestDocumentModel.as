package testSuite.tests
{
	import flexunit.framework.Assert;
	
	import local.malik.skitch.model.DocumentModel;
	import local.malik.skitch.view.drawing.interfaces.IShape;
	import local.malik.skitch.view.drawing.shapes.Rectangle;
	import local.malik.skitch.view.drawing.text.Text;
	
	import mx.collections.ArrayList;
	import mx.collections.IList;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertStrictlyEquals;
	
	public class TestDocumentModel
	{		
		private var document:DocumentModel;
		
		[Before]
		public function setUp():void
		{
			document = new DocumentModel();
			document.eventDispatcher = new NeoSkitchSample();
		}
		
		[After]
		public function tearDown():void
		{
			document.eventDispatcher = null;
			document = null;
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
		public function testAddAll():void
		{
			var shape:IShape = new Rectangle();
			shape.height = 10;
			shape.width = 10;
			shape.x = 5;
			shape.y = 5;
			
			var shape2:IShape = new Rectangle();
			shape2.height = 10;
			shape2.width = 10;
			shape2.x = 5;
			shape2.y = 5;
			
			document.addAll( new ArrayList([shape, shape2]) );			
			assertEquals( 2, document.getAll().length );
			assertStrictlyEquals(shape2,	document.getAll().getItemAt( 1 ) );
		}
		
		[Test]
		public function testAddShape():void
		{
			var shape:IShape = new Rectangle();
			shape.height = 10;
			shape.width = 10;
			shape.x = 5;
			shape.y = 5;
			
			document.addShape( shape );
			
		    assertStrictlyEquals(shape,	document.getAll().getItemAt( 0 ) ); 
		}
		
		[Test]
		public function test_documentName():void
		{
			document.documentName = "Default";
			assertEquals( "Default", document.documentName ); 
		}
		
		
		[Test]
		public function testGetAll():void
		{
			var shape:IShape = new Rectangle();
			shape.height = 10;
			shape.width = 10;
			shape.x = 5;
			shape.y = 5;
			
			document.addShape( shape );
			
			var shape2:IShape = new Rectangle();
			shape2.height = 10;
			shape2.width = 10;
			shape2.x = 5;
			shape2.y = 5;
			
			document.addShape( shape2 );
			
			assertEquals( 2, document.getAll().length );
			assertStrictlyEquals(shape2,	document.getAll().getItemAt( 1 ) ); 
		}
		
		[Test]
		public function testRemoveAll():void
		{
			var shape:IShape = new Rectangle();
			shape.height = 10;
			shape.width = 10;
			shape.x = 5;
			shape.y = 5;
			
			var txt:IShape = new Text();
			txt.height = 10;
			txt.width = 10;
			txt.x = 5;
			txt.y = 5;

			var shape2:IShape = new Rectangle();
			shape2.height = 10;
			shape2.width = 10;
			shape2.x = 5;
			shape2.y = 5;
			
			document.addAll( new ArrayList([shape, txt, shape2]) );			
			document.removeAll( new ArrayList([shape, shape2]) );			
			assertEquals( 1, document.getAll().length );
			assertEquals( txt, document.getAll().getItemAt( 0 ) );
		}
	}
}