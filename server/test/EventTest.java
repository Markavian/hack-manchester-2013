import org.junit.*;
import play.test.*;
import play.mvc.*;
import play.mvc.Http.*;

public class EventTest extends FunctionalTest {

    @Test
    public void testThatGetActionWorks() {
        Response response = GET("/event");

        assertIsOk(response);
        assertContentType("application/json", response);
    }

}