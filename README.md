# myTest

FrontEnd
  created using CSS, HTML, IMAGES, and JAVASCRIPT
  location app/frontend/index.html
  
BackEnd
  created using PHP, SQL, and tested at Visual Code[Thunder Client]
  import db_test.sql for backend
  
  
Statement.sql
  Retrieved data using SQL Statement but not exact result 
  /* retrieve these data */ 
  SELECT tbl_users.email, tbl_users.name, MAX(CASE WHEN tbl_users_meta.meta_key='ip_address' THEN tbl_users_meta.meta_value ELSE tbl_users_meta.meta_value IS NULL END) AS ip_address, MAX(CASE WHEN tbl_users_meta.meta_key='referrer' THEN tbl_users_meta.meta_value ELSE tbl_users_meta.meta_value IS NULL END) AS referrer, MAX(CASE WHEN tbl_users_meta.meta_key='user_agent' THEN tbl_users_meta.meta_value ELSE tbl_users_meta.meta_value IS NULL END) AS user_agent, tbl_users_images.url_path FROM tbl_users_meta LEFT JOIN tbl_users ON tbl_users_meta.user_id = tbl_users.id LEFT JOIN tbl_users_images ON tbl_users.id = tbl_users_images.user_id GROUP BY tbl_users_images.id;
  ![image](https://user-images.githubusercontent.com/5936233/198877583-e0650941-4cd4-4876-a107-aa29f2fc1389.png)
