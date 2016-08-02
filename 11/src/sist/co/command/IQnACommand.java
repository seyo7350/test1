package sist.co.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IQnACommand {

	public void execute(HttpServletRequest request, HttpServletResponse response);
}
