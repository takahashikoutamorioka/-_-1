package scoremanager.main;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class BrainTrainingSelectAction extends Action {

    @Override
    public void execute(HttpServletRequest req,
            HttpServletResponse res) throws Exception {
    	
    	req.setAttribute("trainingError", false);

        req.getRequestDispatcher("brainTraining.jsp").forward(req, res);
    }
}
