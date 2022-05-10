package com.reviews_system.utils;
import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Pagination {
	public Pagination(){};
	private String strPage = null; // page参数变量
	private int curPages;// page参数内部的值
	private int m_rows; // 设置每页显示的页数
	private int pages;// 总页数

	// 取得test.jsp里的test.jsp?page=<%=curPages-1%>或是page=<%=curPages+1%>的值给变量strPage
	public String strPage(HttpServletRequest request, String page) {
		try {
			strPage = request.getParameter(page);// request对象取得page的值
		} catch (Exception e) {
			System.out.println("delcolumn" + e.getMessage());
		}
		return strPage;// 返回这个值。
	} // 页面数

	public int curPages(String strPage) {
		try {
			if (strPage == null) {// 默认没有就设置是第一页
				curPages = 1;
			} else {
				curPages = Integer.parseInt(strPage);// 取得strPage的整数值
				if (curPages < 1)// 如果小于1,同样返回是第一页
					curPages = 1;
			}
		} catch (Exception e) {
			System.out.print("curPages");
		}
		return curPages;// 返回页面数
	}

	// 设置每页要显示的记录数
	public void setRows(int rows) {
		m_rows = rows;
	}

	// 取得页数
	public int getPages(int rowcounts) {
		int test;// 变量
		test = rowcounts % m_rows;// 取得余数
		if (test == 0)
			pages = rowcounts / m_rows;// 每页显示的整数
		else
			pages = rowcounts / m_rows + 1;// 不是的话就加一
		return pages;// 返回页数
	}
	public ResultSet getPageSet(ResultSet rs, int curPages) {//对结果集对象进行分页处理
		if (curPages == 1) {
			return rs;// 如果是就一页的话，就返回这个rs
		} else {
			int i = 1;
			try {
				while (rs.next()) {
					i = i + 1;
					if (i > ((curPages - 1) * m_rows))
						break;// 退出
				}
				return rs;// 从退出开始将结果集返回
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
		}
		return rs;
	}
	// 结果集的返回
	public List  getPageSet(List rs, int curPages) {//对list对象进行分页处理

		List result=new ArrayList();

		try {
			for(int i=(curPages - 1) * m_rows;i<curPages*m_rows&&i<rs.size();i++){
				//(curPages - 1) * m_rows是第几页的第一条数据行号
				//curPages*m_rows是第几页最后一条的行号
				//i<rs.size()是防止数组越界
				result.add(rs.get(i));
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}

		return result;
	}
}
