package common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//추상메소드만 존재한다. 몸통 없음.
public interface InterExecute {
	public void execute(HttpServletRequest request,
			            HttpServletResponse response) throws IOException;
}
