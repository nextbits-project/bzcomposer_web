package com.nxsol.bizcompser.global.table;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.nxsol.bizcomposer.common.ConstValue;
import com.nxsol.bzcomposer.company.domain.BcaCategory;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.repos.BcaCategoryRepository;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;

@Service
public class TblCategoryDtoLoader {

	@Autowired
	BcaCategoryRepository bcaCategoryRepository;
	@Autowired
	BcaCompanyRepository bcaCompanyRepository;

	Vector<TblCategoryDto> categories = new Vector();

	public TblCategoryDto getCategoryOf(int categoryId) {
		load();
		TblCategoryDto TblCategoryDto = null;
		for (TblCategoryDto category : categories) {
			if (category.getId() == categoryId) {
				TblCategoryDto = category;
			}
		}
		return TblCategoryDto;
	}

	public void load() {

		Vector<TblCategoryDto> roots = new Vector();
		Vector<TblCategoryDto> subs = new Vector();

		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		Connection con = null;
		con = db.getConnection();
		String sql1 = " Select * from bca_category where CompanyID =" + ConstValue.companyId
				+ " and isActive=1 and Parent = 'root' order by CategoryTypeID,Name";
		String sql2 = "Select * from bca_category where CompanyID =" + ConstValue.companyId
				+ " and isActive=1 and NOT (Parent='root') order by CategoryTypeID,Name desc";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql1);
			while (rs.next()) {
				TblCategoryDto category = new TblCategoryDto();
				category.setId(rs.getInt("CategoryID"));
				category.setCategoryTypeID(rs.getLong("CategoryTypeID"));
				category.setParent(rs.getString("Parent"));
				category.setDescription(rs.getString("Description"));
				category.setName(rs.getString("Name"));
				// r.setCTypeName = rs.getString("CategoryTypeName");
				category.setCategoryNumber(rs.getString("CateNumber"));
				category.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
				roots.add(category);

			}

			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				TblCategoryDto category = new TblCategoryDto();
				category.setId(rs.getInt("CategoryID"));
				category.setCategoryTypeID(rs.getLong("CategoryTypeID"));
				category.setParent(rs.getString("Parent"));
				category.setDescription(rs.getString("Description"));
				category.setName(rs.getString("Name"));
				// r.setCTypeName = rs.getString("CategoryTypeName");
				category.setCategoryNumber(rs.getString("CateNumber"));
				category.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));

				subs.add(category);

			}

		} catch (SQLException e) {
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (stmt != null) {
					db.close(stmt);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}

		int i = 0;
		while (i < roots.size()) {
			int j = 0;
			String id_root = Long.toString(roots.get(i).getId());
			while (j < subs.size()) {
				String id_sub = subs.get(j).getParent();
				if (id_root.equals(id_sub)) {

					int subLevel = roots.get(i).getSubLevel();
					subs.get(j).setSubLevel(subLevel + 1);
					roots.add(i + 1, subs.get(j));
					subs.removeElementAt(j);
				} else {
					j++;
				}
			}
			i++;
		}

		roots.add(0, new TblCategoryDto());
		categories = roots;
		subs.clear();
		subs = null;
		roots = null;

	}

	public ArrayList<TblCategoryDto> getCategoryForCombo() {
		ArrayList<TblCategoryDto> roots = new ArrayList<TblCategoryDto>();
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		ResultSet rs = null;
//		Connection con = null;
//		con = db.getConnection();

//		String sql1 = "Select * " + " from bca_category" + " where CompanyID = " + ConstValue.companyId
//				+ " and isActive = 1 " + " order by CategoryTypeID,Name ";

		try {
			BcaCompany bcaCompany=bcaCompanyRepository.findByCompanyId(new Long(ConstValue.companyId));
			List<BcaCategory>bcaCategories=bcaCategoryRepository.findByCompanyAndIsActiveOrderByCategoryTypeIdAscNameAsc(bcaCompany, true);
//			stmt = con.createStatement();
//			rs = stmt.executeQuery(sql1);
			for(BcaCategory bcaCategory:bcaCategories) {
				TblCategoryDto category = new TblCategoryDto();
				category.setId(bcaCategory.getCategoryId());
				category.setCategoryTypeID(bcaCategory.getCategoryTypeId());
				category.setParent(bcaCategory.getParent());
				category.setDescription(bcaCategory.getDescription());
				category.setName(bcaCategory.getName());
				// r.setCTypeName = rs.getString("CategoryTypeName");
				category.setCategoryNumber(bcaCategory.getCateNumber());
				category.setBudgetCategoryID(bcaCategory.getBudgetCategoryId());

				roots.add(category);
				
			}

//			while (rs.next()) {
//				TblCategoryDto category = new TblCategoryDto();
//				category.setId(rs.getInt("CategoryID"));
//				category.setCategoryTypeID(rs.getLong("CategoryTypeID"));
//				category.setParent(rs.getString("Parent"));
//				category.setDescription(rs.getString("Description"));
//				category.setName(rs.getString("Name"));
//				// r.setCTypeName = rs.getString("CategoryTypeName");
//				category.setCategoryNumber(rs.getString("CateNumber"));
//				category.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));
//
//				roots.add(category);
//			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		} 
//		finally {
//			try {
//				if (rs != null) {
//					db.close(rs);
//				}
//				if (stmt != null) {
//					db.close(stmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}

		return roots;
	}

	public TblCategoryDto getcategoryById(int id) {
		Statement stmt = null;
		SQLExecutor db = new SQLExecutor();
		ResultSet rs = null;
		Connection con = null;
		con = db.getConnection();
		TblCategoryDto category = null;
		String sql1 = "Select * " + " from bca_category" + " where CompanyID = " + ConstValue.companyId
				+ " and isActive = 1 AND CategoryID = " + id + " order by CategoryTypeID,Name ";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql1);

			while (rs.next()) {
				category = new TblCategoryDto();
				category.setId(rs.getInt("CategoryID"));
				category.setCategoryTypeID(rs.getLong("CategoryTypeID"));
				category.setParent(rs.getString("Parent"));
				category.setDescription(rs.getString("Description"));
				category.setName(rs.getString("Name"));
				// r.setCTypeName = rs.getString("CategoryTypeName");
				category.setCategoryNumber(rs.getString("CateNumber"));
				category.setBudgetCategoryID(rs.getInt("BudgetCategoryID"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Loger.log(e.toString());
		} finally {
			try {
				if (rs != null) {
					db.close(rs);
				}
				if (stmt != null) {
					db.close(stmt);
				}
				if (con != null) {
					db.close(con);
				}
			} catch (Exception e) {
				Loger.log(e.toString());
			}
		}
		return category;
	}

}
