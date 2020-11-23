# トップページ
crumb :root do
  link "トップページ", root_path
end

# マイページ
crumb :mypage do
  link "マイページ", users_path
end

# クレジットカード情報入力
crumb :new_credit_card do
  link "クレジットカード情報入力", new_credit_card_path
  parent :mypage
end

# ログアウトページ
crumb :logout do
  link "ログアウト", users_path
  parent :mypage
end

# ログイン
crumb :user_session do
  link "ログイン", user_session_path
  parent :root
end

# 新規会員登録
crumb :new_user_registration do
  link "新規会員登録", new_user_registration_path
  parent :root
end



# crumb :category_index do
#   link "カテゴリー一覧", categories_path
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).