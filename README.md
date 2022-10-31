# myTest

FrontEnd
  created using CSS, HTML, IMAGES, and JAVASCRIPT
  location app/frontend/index.html
  
BackEnd
  created using PHP, SQL, and tested at Visual Code[Thunder Client]
  import db_test.sql for backend
  
  
Statement.sql
  Retrieved data using SQL Statement 
  /* retrieve these data */ 
  SELECT tbl_users.email, tbl_users.name, MAX(CASE WHEN tbl_users_meta.meta_key='ip_address' THEN tbl_users_meta.meta_value ELSE tbl_users_meta.meta_value IS NULL END) AS ip_address, MAX(CASE WHEN tbl_users_meta.meta_key='referrer' THEN tbl_users_meta.meta_value ELSE tbl_users_meta.meta_value IS NULL END) AS referrer, MAX(CASE WHEN tbl_users_meta.meta_key='user_agent' THEN tbl_users_meta.meta_value ELSE tbl_users_meta.meta_value IS NULL END) AS user_agent, GROUP_CONCAT(DISTINCT(tbl_users_images.url_path) SEPARATOR '\n') as path FROM tbl_users_meta LEFT JOIN tbl_users ON tbl_users_meta.user_id = tbl_users.id LEFT JOIN tbl_users_images ON tbl_users.id = tbl_users_images.user_id GROUP BY tbl_users.id;

![image](https://user-images.githubusercontent.com/5936233/199088507-7046faa0-6cd7-4c9a-b8bb-9f6b68c53913.png)
