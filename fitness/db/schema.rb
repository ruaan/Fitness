# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150331123919) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.string   "address",    limit: 255
    t.string   "vat",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "apis", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "subsection_id"
    t.integer  "section_id"
    t.integer  "quantity"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quote_id"
  end

  create_table "copysecs", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "section_id"
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "copysubs", force: :cascade do |t|
    t.integer  "section_id"
    t.integer  "subsection_id"
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        limit: 255
    t.string   "section",     limit: 255
    t.string   "subsection",  limit: 255
    t.integer  "product_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "globals", force: :cascade do |t|
    t.integer  "section_id"
    t.string   "name",                   limit: 255
    t.string   "section",                limit: 255
    t.string   "subsection",             limit: 255
    t.string   "image",                  limit: 255
    t.string   "title",                  limit: 255
    t.string   "sku",                    limit: 255
    t.string   "quantity",               limit: 255
    t.string   "description",            limit: 255
    t.string   "subdecription",          limit: 255
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "catagory",               limit: 255
    t.string   "favname",                limit: 255
    t.string   "section_description"
    t.string   "subsection_description"
  end

  create_table "installcatagorizations", force: :cascade do |t|
    t.integer  "lineitem_id"
    t.integer  "install_id"
    t.integer  "product_id"
    t.string   "product_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installs", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "image",          limit: 255
    t.string   "title",          limit: 255
    t.string   "sku",            limit: 255
    t.string   "category",       limit: 255
    t.decimal  "price"
    t.string   "quantity",       limit: 255
    t.string   "description",    limit: 255
    t.string   "subdescription", limit: 255
    t.decimal  "exvat_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lineitems", force: :cascade do |t|
    t.string   "image",          limit: 255
    t.string   "title",          limit: 255
    t.string   "sku",            limit: 255
    t.string   "catagory",       limit: 255
    t.decimal  "price"
    t.string   "description",    limit: 255
    t.string   "subdescription", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "buom",           limit: 255
    t.string   "suom",           limit: 255
    t.integer  "umren"
    t.integer  "umrez"
    t.string   "techimage",      limit: 255
    t.integer  "subsection_id"
    t.integer  "inclvat"
    t.boolean  "vatex"
    t.integer  "quantity"
    t.decimal  "exvat_price"
  end

  create_table "lineitemscatagorizations", force: :cascade do |t|
    t.integer  "lineitem_id"
    t.integer  "subsection_id"
    t.integer  "quantity"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magento_integrations", force: :cascade do |t|
    t.string   "refNumber",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magentopushes", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magentos", force: :cascade do |t|
    t.string   "refNumber",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodic_jobs", force: :cascade do |t|
    t.string   "type",        limit: 255
    t.string   "job",         limit: 255
    t.integer  "interval"
    t.datetime "last_run_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "image",          limit: 255
    t.string   "title",          limit: 255
    t.string   "sku",            limit: 255
    t.string   "catagory",       limit: 255
    t.decimal  "price"
    t.string   "description",    limit: 255
    t.string   "subdescription", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "exvat_price"
    t.integer  "umren"
    t.integer  "umrez"
    t.string   "techimage",      limit: 255
    t.string   "buom",           limit: 255
    t.string   "suom",           limit: 255
    t.string   "size",           limit: 255
    t.string   "manufacturer",   limit: 255
    t.string   "color",          limit: 255
    t.string   "sapDe",          limit: 255
    t.string   "material",       limit: 255
    t.string   "range",          limit: 255
    t.string   "finish",         limit: 255
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "projectName",   limit: 255
    t.string   "version",       limit: 255
    t.string   "documentType",  limit: 255
    t.string   "market",        limit: 255
    t.decimal  "randDollar"
    t.decimal  "randPound"
    t.string   "address",       limit: 255
    t.string   "contactPerson", limit: 255
    t.string   "contactNumber", limit: 255
    t.string   "notes",         limit: 255
    t.integer  "flag"
    t.string   "steps",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sapCode"
    t.integer  "user_id"
    t.boolean  "exvat"
  end

  create_table "quotes", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "section_id"
    t.integer  "subsection_id"
    t.integer  "fav_id"
    t.boolean  "fav"
    t.string   "image",          limit: 255
    t.string   "title",          limit: 255
    t.string   "sku",            limit: 255
    t.string   "category",       limit: 255
    t.string   "manufacturer",   limit: 255
    t.string   "price",          limit: 255
    t.integer  "discount"
    t.string   "description",    limit: 255
    t.string   "subdescription", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sappushes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saps", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "misc",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "soaps", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storeaddresses", force: :cascade do |t|
    t.string   "storecode",  limit: 255
    t.string   "head",       limit: 255
    t.string   "line1",      limit: 255
    t.string   "line2",      limit: 255
    t.string   "line3",      limit: 255
    t.string   "line4",      limit: 255
    t.string   "line5",      limit: 255
    t.string   "line6",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subsections", force: :cascade do |t|
    t.integer  "section_id"
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "training_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "training_mode"
    t.string   "role",                   limit: 255
    t.string   "storeCode",              limit: 255
    t.integer  "magento_id"
    t.string   "magento_token",          limit: 255
    t.string   "magento_secret",         limit: 255
    t.integer  "branchCode"
    t.string   "fullName",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "version",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "all"
  end

end
