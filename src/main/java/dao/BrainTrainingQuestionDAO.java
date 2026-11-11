package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.brain_training_question;

public class BrainTrainingQuestionDAO extends DAO {

    /**
     * 脳トレ種別ごとの問題取得
     * 1:計算
     * 2:記憶力
     * 3:クイズ
     * 4:神経衰弱
     */
    public List<brain_training_question> findByTrainingId(
            int trainingId) throws Exception {

        List<brain_training_question> list =
                new ArrayList<>();

        Connection con = getConnection();

        PreparedStatement st = con.prepareStatement(
                "SELECT * "
              + "FROM brain_training_question "
              + "WHERE brain_training_id = ?");

        st.setInt(1, trainingId);

        ResultSet rs = st.executeQuery();

        while (rs.next()) {

            brain_training_question question =
                    new brain_training_question();

            question.setQuestionId(
                    rs.getInt("question_id"));

            question.setBrainTrainingId(
                    rs.getInt("brain_training_id"));

            question.setQuestionText(
                    rs.getString("question_text"));

            question.setChoice1(
                    rs.getString("choice1"));

            question.setChoice2(
                    rs.getString("choice2"));

            question.setChoice3(
                    rs.getString("choice3"));

            question.setChoice4(
                    rs.getString("choice4"));

            question.setCorrectAnswer(
                    rs.getInt("correct_answer"));

            list.add(question);
        }

        rs.close();
        st.close();
        con.close();

        return list;
    }
}