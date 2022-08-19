package junting.tech.servlet.obj;


import junting.tech.myssm.myspringmvc.ViewBaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

@WebServlet("/list.do")
public class ListServlet extends ViewBaseServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("aNotEmptyList", Arrays.asList("aaa","bbb","ccc"));
        request.setAttribute("anEmptyList", new ArrayList<>());
        processTemplate("list.html", request, response);
    }
}
