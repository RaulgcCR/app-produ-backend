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

ActiveRecord::Schema.define(version: 20190204001551) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fase_type_id"
    t.bigint "activity_type_id"
    t.index ["activity_type_id"], name: "index_activities_on_activity_type_id"
    t.index ["fase_type_id"], name: "index_activities_on_fase_type_id"
  end

  create_table "activity_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "colaborators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_colaborators_on_project_id"
    t.index ["user_id"], name: "index_colaborators_on_user_id"
  end

  create_table "fase_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.float "p", limit: 24
    t.float "q", limit: 24
    t.float "error", limit: 24
    t.float "z", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sampling_id"
    t.bigint "fase_type_id"
    t.index ["fase_type_id"], name: "index_fases_on_fase_type_id"
    t.index ["sampling_id"], name: "index_fases_on_sampling_id"
  end

  create_table "operator_registers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "path_id"
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_operator_registers_on_activity_id"
    t.index ["path_id"], name: "index_operator_registers_on_path_id"
  end

  create_table "paths", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "cantOperarios"
    t.integer "temperatura"
    t.integer "humedad"
    t.date "fecha"
    t.time "hora"
    t.text "comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fase_id"
    t.index ["fase_id"], name: "index_paths_on_fase_id"
  end

  create_table "positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "samplings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.integer "cantMuestras"
    t.integer "cantMuestrasTotal"
    t.text "descripcion"
    t.integer "fase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.index ["project_id"], name: "index_samplings_on_project_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre"
    t.string "apellido1"
    t.string "apellido2"
    t.string "correo"
    t.string "password"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "position_id"
    t.index ["position_id"], name: "index_users_on_position_id"
  end

  add_foreign_key "activities", "activity_types"
  add_foreign_key "activities", "fase_types"
  add_foreign_key "colaborators", "projects"
  add_foreign_key "colaborators", "users"
  add_foreign_key "fases", "fase_types"
  add_foreign_key "fases", "samplings"
  add_foreign_key "operator_registers", "activities"
  add_foreign_key "operator_registers", "paths"
  add_foreign_key "paths", "fases"
  add_foreign_key "projects", "users"
  add_foreign_key "samplings", "projects"
  add_foreign_key "users", "positions"
end
