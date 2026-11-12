package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.ninchi_question;

public class NinchiQuestionDAO extends DAO {

	public List<ninchi_question> findRandom()
			throws Exception {

		List<ninchi_question> list =
				new ArrayList<>();

		Connection con =
				getConnection();

		PreparedStatement st =
				con.prepareStatement(
						"""
						SELECT *
						FROM ninchi_question
						ORDER BY RANDOM()
						"""
				);

		ResultSet rs =
				st.executeQuery();

		while (rs.next()) {

			ninchi_question q =
					new ninchi_question();

			q.setQuestionId(
					rs.getInt(
							"question_id"));

			q.setQuestionText(
					rs.getString(
							"question_text"));

			q.setChoice1(
					rs.getString(
							"choice1"));

			q.setChoice2(
					rs.getString(
							"choice2"));

			q.setChoice3(
					rs.getString(
							"choice3"));

			q.setChoice4(
					rs.getString(
							"choice4"));

			q.setCorrectAnswer(
					rs.getInt(
							"correct_answer"));

			list.add(q);
		}

		st.close();
		con.close();

		return list;
	}
}