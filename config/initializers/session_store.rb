if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_jibunseki-front', domain: 'フロントエンドのドメイン'
else
    Rails.application.config.session_store :cookie_store, key: '_jibunseki-front'
end