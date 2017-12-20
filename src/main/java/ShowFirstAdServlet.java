import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ShowFirstAdServlet", urlPatterns = "/show-first-ad")
public class ShowFirstAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // use the factory to get a dao,
        // use that dao to get an Ad
        Ads adDao = DaoFactory.getAdsDao();
        Ad theFirstAd = adDao.all().get(0);

        System.out.println("----------------------------------------");
        System.out.println("id#" + theFirstAd.getId());
        System.out.println("title: " + theFirstAd.getTitle());
        System.out.println("description" + theFirstAd.getDescription());
        System.out.println("----------------------------------------");

        response.getWriter().println("ok, check out your console!");
    }
}
