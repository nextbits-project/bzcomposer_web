package com.avibha.bizcomposer.sales.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avibha.bizcomposer.sales.forms.ItemCategoryDto;
import com.avibha.common.db.SQLExecutor;
import com.avibha.common.log.Loger;
import com.nxsol.bzcomposer.company.domain.BcaCompany;
import com.nxsol.bzcomposer.company.domain.ItemCategoryDetails;
import com.nxsol.bzcomposer.company.domain.ItemDetails;
import com.nxsol.bzcomposer.company.repos.BcaCompanyRepository;
import com.nxsol.bzcomposer.company.repos.ItemCategoryDetailsRepository;
import com.nxsol.bzcomposer.company.repos.ItemDetailsRepository;

@Service
public class ItemCategoryManagerDao {

	private final ItemCategoryDetailsRepository itemCategoryDetailsRepository;
	private final BcaCompanyRepository bcaCompanyRepository;
	private final ItemDetailsRepository itemDetailsRepository;

	@Autowired
	public ItemCategoryManagerDao(ItemCategoryDetailsRepository itemCategoryDetailsRepository,
			ItemDetailsRepository itemDetailsRepository, BcaCompanyRepository bcaCompanyRepository) {
		this.itemCategoryDetailsRepository = itemCategoryDetailsRepository;
		this.itemDetailsRepository = itemDetailsRepository;
		this.bcaCompanyRepository = bcaCompanyRepository;

	}

	/**
	 * Get Main-Category List
	 */
//    public ArrayList getMainCategoryList(String compId) {
//        Connection con = null;
//        Statement stmt = null;
//        ResultSet rs = null;
//        SQLExecutor db = new SQLExecutor();
//        ArrayList<ItemCategoryDto> objList = new ArrayList<>();
//        try {
//            con = db.getConnection();
//            stmt = con.createStatement();
//            String sql = "SELECT * FROM item_category_details WHERE Deleted=0 AND ParentID='root' AND CompanyID="+compId;
//            rs = stmt.executeQuery(sql);
//            while (rs.next()) {
//                ItemCategoryDto itemCategoryDto = new ItemCategoryDto();
//                itemCategoryDto.setCategoryID(rs.getLong("CategoryID"));
//                itemCategoryDto.setCompanyID(rs.getInt("CompanyID"));
//                itemCategoryDto.setParentID(rs.getString("ParentID"));
//                itemCategoryDto.setCategoryName(rs.getString("CategoryName"));
//                itemCategoryDto.setDescription(rs.getString("Description"));
//                itemCategoryDto.setActive(rs.getBoolean("Active"));
//                itemCategoryDto.setDateAdded(rs.getString("DateAdded"));
//                objList.add(itemCategoryDto);
//            }
//        } catch (Exception e) {
//            Loger.log(e.toString());
//        }finally {
//            try {
//                if (rs != null) { db.close(rs); }
//                if (stmt != null) { db.close(stmt); }
//                if(con != null){ db.close(con); }
//            } catch (Exception e) {
//                Loger.log(e.toString());
//            }
//        }
//        return objList;
//    }
	public List<ItemCategoryDto> getMainCategoryList(String compId) {
		List<ItemCategoryDto> objList = new ArrayList<ItemCategoryDto>();
		try {
			BcaCompany bcaCompany = new BcaCompany();
			bcaCompany = bcaCompanyRepository.findByCompanyId(Long.parseLong(compId));
			List<ItemCategoryDetails> categoryDetails = itemCategoryDetailsRepository
					.findByDeletedAndParentIdAndCompany(false, "root", bcaCompany);
			for (ItemCategoryDetails rs : categoryDetails) {
				ItemCategoryDto itemCategoryDto = new ItemCategoryDto();
				itemCategoryDto.setCategoryID(rs.getCategoryId());
				Long companyIdLong = rs.getCompany().getCompanyId();
				int companyIdInt = companyIdLong.intValue();
				itemCategoryDto.setCompanyID(companyIdInt);
				itemCategoryDto.setParentID(rs.getParentId());
				itemCategoryDto.setCategoryName(rs.getCategoryName());
				itemCategoryDto.setDescription(rs.getDescription());
				itemCategoryDto.setActive(rs.getActive());
				itemCategoryDto.setDateAdded(rs.getDateAdded().toString());
				objList.add(itemCategoryDto);
			}

		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return objList;

	}

	/**
	 * Get Sub-Category List
	 */
//	public List<ItemCategoryDto> getSubCategoryList(String compId) {
//		Connection con = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<ItemCategoryDto> objList = new ArrayList<>();
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			String sql = "SELECT * FROM item_category_details WHERE Deleted=0 AND ParentID<>'root' AND CompanyID="
//					+ compId;
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				ItemCategoryDto itemCategoryDto = new ItemCategoryDto();
//				itemCategoryDto.setCategoryID(rs.getLong("CategoryID"));
//				itemCategoryDto.setCompanyID(rs.getInt("CompanyID"));
//				itemCategoryDto.setParentID(rs.getString("ParentID"));
//				itemCategoryDto.setCategoryName(rs.getString("CategoryName"));
//				itemCategoryDto.setDescription(rs.getString("Description"));
//				itemCategoryDto.setActive(rs.getBoolean("Active"));
//				itemCategoryDto.setDateAdded(rs.getString("DateAdded"));
//				objList.add(itemCategoryDto);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
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
//		return objList;
//	}

	public List<ItemCategoryDto> getSubCategoryList(String compId) {
		List<ItemCategoryDto> itemCategoryDetails = new ArrayList<>();
		try {
			BcaCompany bcaCompany = new BcaCompany();
			bcaCompany = bcaCompanyRepository.findByCompanyId(Long.parseLong(compId));
			List<ItemCategoryDetails> categoryDetails = itemCategoryDetailsRepository.findSubCategoryList(bcaCompany);
			for (ItemCategoryDetails details : categoryDetails) {
				ItemCategoryDto itemCategoryDto = new ItemCategoryDto();
				itemCategoryDto.setCategoryID(details.getCategoryId());
				Long companyIdLong = details.getCompany().getCompanyId();
				int companyIdInt = companyIdLong.intValue();
				itemCategoryDto.setCompanyID(companyIdInt);
				itemCategoryDto.setParentID(details.getParentId());
				itemCategoryDto.setCategoryName(details.getCategoryName());
				itemCategoryDto.setDescription(details.getDescription());
				itemCategoryDto.setActive(details.getActive());
				itemCategoryDto.setDateAdded(details.getDateAdded().toString());
				itemCategoryDetails.add(itemCategoryDto);
			}

		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return itemCategoryDetails;
	}

	/**
	 * Get Main/Sub-Category Details
	 */
//	public ItemCategoryDto getCategoryDetails(long catID) {
//		Connection con = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//		SQLExecutor db = new SQLExecutor();
//		ItemCategoryDto itemCategoryDto = new ItemCategoryDto();
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			String sql = "SELECT * FROM item_category_details WHERE Deleted=0 AND CategoryID=" + catID;
//			rs = stmt.executeQuery(sql);
//			if (rs.next()) {
//				itemCategoryDto.setCategoryID(rs.getLong("CategoryID"));
//				itemCategoryDto.setCompanyID(rs.getInt("CompanyID"));
//				itemCategoryDto.setParentID(rs.getString("ParentID"));
//				itemCategoryDto.setCategoryName(rs.getString("CategoryName"));
//				itemCategoryDto.setDescription(rs.getString("Description"));
//				itemCategoryDto.setActive(rs.getBoolean("Active"));
//				itemCategoryDto.setDateAdded(rs.getString("DateAdded"));
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
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
//		return itemCategoryDto;
//	}
	public ItemCategoryDto getCategoryDetails(long catID) {

		ItemCategoryDto itemCategoryDto = new ItemCategoryDto();
		try {
			ItemCategoryDetails itemCategoryDetails = new ItemCategoryDetails();
			itemCategoryDetails = itemCategoryDetailsRepository.findByDeletedAndCategoryId(false, catID);
			if (itemCategoryDetails.equals(null)) {
				itemCategoryDto.setCategoryID(itemCategoryDetails.getCategoryId());
				Long companyIdLong = itemCategoryDetails.getCompany().getCompanyId();
				int companyIdInt = companyIdLong.intValue();
				itemCategoryDto.setCompanyID(companyIdInt);
				itemCategoryDto.setParentID(itemCategoryDetails.getParentId());
				itemCategoryDto.setCategoryName(itemCategoryDetails.getCategoryName());
				itemCategoryDto.setDescription(itemCategoryDetails.getDescription());
				itemCategoryDto.setActive(itemCategoryDetails.getActive());
				itemCategoryDto.setDateAdded(itemCategoryDetails.getDateAdded().toString());
			}

		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return itemCategoryDto;
	}

	/**
	 * Delete-Category Details
	 */
//	public boolean deleteCategoryDetails(long catID) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		boolean status = false;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			String sql = "UPDATE item_category_details SET Deleted=1 WHERE CategoryID=" + catID;
//			int rowChanged = stmt.executeUpdate(sql);
//			if (rowChanged > 0) {
//				status = true;
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return status;
//	}
	public boolean deleteCategoryDetails(long catID) {
		boolean status = false;
		try {
			int success = itemCategoryDetailsRepository.deleteCategoryDetails(catID);
			status = success > 0 ? true : false;

		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return status;

	}

	/**
	 * Save Main/Sub-Category Details
	 */
//	public boolean saveCategoryDetails(ItemCategoryDto itemCatDto) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		boolean status = false;
//		try {
//			con = db.getConnection();
//			if (itemCatDto.getCategoryID() > 0) {
//				String sql = "UPDATE item_category_details SET ParentID=?, CompanyID=?, CategoryName=?, Description=?, Active=? WHERE CategoryID=?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, itemCatDto.getParentID());
//				pstmt.setInt(2, itemCatDto.getCompanyID());
//				pstmt.setString(3, itemCatDto.getCategoryName().trim());
//				pstmt.setString(4, itemCatDto.getDescription().trim());
//				pstmt.setBoolean(5, itemCatDto.isActive());
//				pstmt.setLong(6, itemCatDto.getCategoryID());
//			} else {
//				String sql = "INSERT INTO item_category_details(ParentID,CompanyID,CategoryName,Description,Active,Deleted,DateAdded)"
//						+ " VALUES(?,?,?,?,?,?,?)";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, itemCatDto.getParentID());
//				pstmt.setInt(2, itemCatDto.getCompanyID());
//				pstmt.setString(3, itemCatDto.getCategoryName().trim());
//				pstmt.setString(4, itemCatDto.getDescription().trim());
//				pstmt.setBoolean(5, itemCatDto.isActive());
//				pstmt.setBoolean(6, false);
//				pstmt.setDate(7, getDateObject("now()"));
//			}
//			int count = pstmt.executeUpdate();
//			if (count > 0)
//				status = true;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return status;
//	}

	public boolean saveCategoryDetails(ItemCategoryDto itemCatDto) {
		boolean status = false;
		try {
			if (itemCatDto.getCategoryID() > 0) {
				int _status = itemCategoryDetailsRepository.updateCategoryDetails(itemCatDto.getParentID(),
						itemCatDto.getCategoryName().trim(), itemCatDto.getDescription().trim(), itemCatDto.isActive(),
						itemCatDto.getCategoryID());
				status = _status > 0 ? true : false;
			} else {
				ItemCategoryDetails details = new ItemCategoryDetails();
				BcaCompany bcaCompany = new BcaCompany();

				int companyIdInt = itemCatDto.getCompanyID();
				Long companyIdLong = new Long(companyIdInt);
				bcaCompany = bcaCompanyRepository.findByCompanyId(companyIdLong);
				details.setParentId(itemCatDto.getParentID());
				details.setCompany(bcaCompany);
				details.setCategoryName(itemCatDto.getCategoryName().trim());
				details.setDescription(itemCatDto.getDescription().trim());
				details.setActive(itemCatDto.isActive());
				details.setDeleted(false);
				Date date = new Date();

				Instant instant = date.toInstant();
				ZoneOffset offset = ZoneOffset.UTC;
				OffsetDateTime offsetDateTime = OffsetDateTime.ofInstant(instant, offset);

				details.setDateAdded(offsetDateTime);
				itemCategoryDetailsRepository.save(details);
			}
		} catch (Exception e) {
			System.out.println(e);
			Loger.log(e.toString());
		}
		return status;
	}

//    ======================================= Manage-Item-Details ===========================================
	/**
	 * Get Item List
	 */
//	public ArrayList getItemList(String compId) {
//		Connection con = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//		SQLExecutor db = new SQLExecutor();
//		ArrayList<ItemCategoryDto> objList = new ArrayList<>();
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			String sql = "SELECT i.*,c.CategoryName FROM item_details AS i INNER JOIN item_category_details AS c ON i.CategoryID=c.CategoryID"
//					+ " WHERE i.Deleted=0 AND c.Deleted=0 AND c.CompanyID=" + compId;
//			rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				ItemCategoryDto itemCategoryDto = new ItemCategoryDto();
//				itemCategoryDto.setItemID(rs.getLong("ID"));
//				itemCategoryDto.setCategoryID(rs.getLong("CategoryID"));
//				itemCategoryDto.setCategoryName(rs.getString("CategoryName"));
//				itemCategoryDto.setItemName(rs.getString("Name"));
//				itemCategoryDto.setDescription(rs.getString("Description"));
//				itemCategoryDto.setActive(rs.getBoolean("Active"));
//				itemCategoryDto.setDateAdded(getDateStrign(rs.getDate("DateAdded")));
//				objList.add(itemCategoryDto);
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
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
//		return objList;
//	}
	public List<ItemCategoryDto> getItemList(String compId) {

		List<ItemCategoryDto> objList = new ArrayList<>();
		try {
			BcaCompany bcaCompany = new BcaCompany();
			bcaCompany = bcaCompanyRepository.findByCompanyId(Long.parseLong(compId));
			List<Object[]> itemDetails = itemDetailsRepository.findItemsWithCategoryNameByCompany(bcaCompany);
			for (Object[] itemWithCategoryName : itemDetails) {
				ItemDetails item = (ItemDetails) itemWithCategoryName[0];
				String categoryName = (String) itemWithCategoryName[1];
				ItemCategoryDto itemCategoryDto = new ItemCategoryDto();
				itemCategoryDto.setItemID(item.getId());
				itemCategoryDto.setCategoryID(item.getCategory().getCategoryId());
				itemCategoryDto.setCategoryName(categoryName);
				itemCategoryDto.setItemName(item.getName());
				itemCategoryDto.setDescription(item.getDescription());
				itemCategoryDto.setActive(item.getActive());
				OffsetDateTime offsetDateTime = item.getDateAdded();
				java.sql.Date date = new java.sql.Date(offsetDateTime.toInstant().toEpochMilli());
				itemCategoryDto.setDateAdded(getDateStrign(date));
				objList.add(itemCategoryDto);

			}

		} catch (Exception e) {
			Loger.log(e.toString());
		}

		return objList;
	}

	/**
	 * Get Item Details
	 */
//	public ItemCategoryDto getItemDetails(long catID) {
//		Connection con = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//		SQLExecutor db = new SQLExecutor();
//		ItemCategoryDto itemCategoryDto = new ItemCategoryDto();
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			String sql = "SELECT i.*,c.CategoryName FROM item_details AS i INNER JOIN item_category_details AS c ON i.CategoryID=c.CategoryID WHERE c.ID="
//					+ catID;
//			rs = stmt.executeQuery(sql);
//			if (rs.next()) {
//				itemCategoryDto.setItemID(rs.getLong("ID"));
//				itemCategoryDto.setCategoryID(rs.getLong("CategoryID"));
//				itemCategoryDto.setCategoryName(rs.getString("CategoryName"));
//				itemCategoryDto.setItemName(rs.getString("Name"));
//				itemCategoryDto.setDescription(rs.getString("Description"));
//				itemCategoryDto.setActive(rs.getBoolean("Active"));
//				itemCategoryDto.setDateAdded(rs.getString("DateAdded"));
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
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
//		return itemCategoryDto;
//	}

	public ItemCategoryDto getItemDetails(long catID) {
		ItemCategoryDto itemCategoryDto = new ItemCategoryDto();
		try {
			Object itemDetails = itemDetailsRepository.findItemDetails(catID);
			ItemDetails item = (ItemDetails) itemDetails;
			String categoryName = (String) itemDetails;
			itemCategoryDto.setItemID(item.getId());
			itemCategoryDto.setCategoryID(item.getCategory().getCategoryId());
			itemCategoryDto.setCategoryName(categoryName);
			itemCategoryDto.setItemName(item.getName());
			itemCategoryDto.setDescription(item.getDescription());
			itemCategoryDto.setActive(item.getActive());
			OffsetDateTime offsetDateTime = item.getDateAdded();
			java.sql.Date date = new java.sql.Date(offsetDateTime.toInstant().toEpochMilli());
			itemCategoryDto.setDateAdded(getDateStrign(date));
		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return itemCategoryDto;
	}

	/**
	 * Delete-Item Details
	 */
//	public boolean deleteItemDetails(long catID) {
//		Connection con = null;
//		Statement stmt = null;
//		SQLExecutor db = new SQLExecutor();
//		boolean status = false;
//		try {
//			con = db.getConnection();
//			stmt = con.createStatement();
//			String sql = "UPDATE item_details SET Deleted=1 WHERE ID=" + catID;
//			int rowChanged = stmt.executeUpdate(sql);
//			if (rowChanged > 0) {
//				status = true;
//			}
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
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
//		return status;
//	}

	public boolean deleteItemDetails(String catID) {
		boolean status = false;
		try {
			List<Long> catIDList = Arrays.stream(catID.split(","))
                    .map(Long::parseLong)
                    .collect(Collectors.toList());
			int _status = itemDetailsRepository.deleteItemDetails(catIDList);
			status = _status > 0 ? true : false;
		} catch (Exception e) {
			Loger.log(e.toString());
		}
		return status;
	}

	/**
	 * Save Item Details
	 */
//	public boolean saveItemDetails(ItemCategoryDto itemCatDto) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		SQLExecutor db = new SQLExecutor();
//		boolean status = false;
//		try {
//			con = db.getConnection();
//			if (itemCatDto.getItemID() > 0) {
//				if (itemCatDto.getItemIDs().split(",").length > 1) {
//					String sql = "UPDATE item_details SET CategoryID=?, Active=? WHERE ID IN(" + itemCatDto.getItemIDs()
//							+ ")";
//					pstmt = con.prepareStatement(sql);
//					pstmt.setLong(1, itemCatDto.getItemCategoryID());
//					pstmt.setBoolean(2, itemCatDto.isItemActive());
//				} else {
//					String sql = "UPDATE item_details SET CategoryID=?, Name=?, Description=?, Active=? WHERE ID=?";
//					pstmt = con.prepareStatement(sql);
//					pstmt.setLong(1, itemCatDto.getItemCategoryID());
//					pstmt.setString(2, itemCatDto.getItemName().trim());
//					pstmt.setString(3, itemCatDto.getItemDescription().trim());
//					pstmt.setBoolean(4, itemCatDto.isItemActive());
//					pstmt.setLong(5, itemCatDto.getItemID());
//				}
//			} else {
//				String sql = "INSERT INTO item_details(CategoryID,Name,Description,Active,Deleted,DateAdded) VALUES(?,?,?,?,?,?)";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setLong(1, itemCatDto.getItemCategoryID());
//				pstmt.setString(2, itemCatDto.getItemName().trim());
//				pstmt.setString(3, itemCatDto.getItemDescription().trim());
//				pstmt.setBoolean(4, itemCatDto.isItemActive());
//				pstmt.setBoolean(5, false);
//				pstmt.setDate(6, getDateObject("now()"));
//			}
//			int count = pstmt.executeUpdate();
//			if (count > 0)
//				status = true;
//		} catch (Exception e) {
//			Loger.log(e.toString());
//		} finally {
//			try {
//				if (pstmt != null) {
//					db.close(pstmt);
//				}
//				if (con != null) {
//					db.close(con);
//				}
//			} catch (Exception e) {
//				Loger.log(e.toString());
//			}
//		}
//		return status;
//	}
	public boolean saveItemDetails(ItemCategoryDto itemCatDto) {
		boolean status = true;
		try {
			if (itemCatDto.getItemID() > 0) {
				if (itemCatDto.getItemIDs().split(",").length > 1) {
					itemCatDto.getItemIDs();
					itemDetailsRepository.updateCategoryAndActive(itemCatDto.getItemCategoryID(),
							itemCatDto.isItemActive(), itemCatDto.getItemIDs());
				} else {
					ItemCategoryDetails categoryDetails = itemCategoryDetailsRepository
							.findByCategoryId(itemCatDto.getItemCategoryID());

					ItemDetails item = itemDetailsRepository.findById(itemCatDto.getItemID());

					if (item != null) {
						// Make changes to the entity
						item.setCategory(categoryDetails);
						item.setActive(itemCatDto.isItemActive());
						item.setDescription(itemCatDto.getItemDescription().trim());
						item.setName(itemCatDto.getItemName().trim());

						// Save the updated entity
						itemDetailsRepository.save(item);
					}
				}
			} else {
				ItemCategoryDetails categoryDetails = itemCategoryDetailsRepository
						.findByCategoryId(itemCatDto.getItemCategoryID());
				ItemDetails details = new ItemDetails();
				details.setCategory(categoryDetails);
				details.setName(itemCatDto.getItemName().trim());
				details.setDescription(itemCatDto.getItemDescription().trim());
				details.setActive(itemCatDto.isItemActive());
				details.setDeleted(false);
				Date date = new Date();

				Instant instant = date.toInstant();
				ZoneOffset offset = ZoneOffset.UTC;
				OffsetDateTime offsetDateTime = OffsetDateTime.ofInstant(instant, offset);

				details.setDateAdded(offsetDateTime);
				itemDetailsRepository.save(details);

			}

		} catch (Exception e) {
			System.out.println(e);
			status = false;
			Loger.log(e.toString());
		}
		return status;

	}

	private java.sql.Date getDateObject(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		Date d1 = null;
		try {
			d1 = sdf.parse(date);
		} catch (ParseException e) {
			Loger.log(2, "ParseException" + e.getMessage());
		}
		return (d1 != null ? new java.sql.Date(d1.getTime()) : new java.sql.Date(new Date().getTime()));
	}

	private String getDateStrign(java.sql.Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
		String myDate = null;
		try {
			myDate = sdf.format(date);
		} catch (Exception e) {
			Loger.log(2, "ParseException" + e.getMessage());
		}
		return myDate;
	}
}
