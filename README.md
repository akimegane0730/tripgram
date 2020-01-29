# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
 # -v 5.2

* System dependencies

* Configuration

* Database creation



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# DB設計

## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|mail|string|unique:true, null:false|
|password|string|null:false, null:false|
|re_password|string|null:false, null:false|

### Association
- has_many :comments
- has_many :posts
- has_many :likes

## comments テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false|
|user_id|text|null:false|
|post_id|reference|null:false|
|user_id|reference|null:false|

### Association
- belongs_to :user
- belongs_to :post

## posts テーブル
|Column|Type|Options|
|------|----|-------|
|content|text||
|user_id|text|null:false|

### Association
- has_many :comments
- has_many :photos
- has_many :likes
- has_many :hashtag, through: posts_hashtag
- belongs_to :user

## likes テーブル
|Column|Type|Options|
|------|----|-------|
|post_id|reference|null:false|
|user_id|reference|null:false|

### Association
- belongs_to :post
- belongs_to :user