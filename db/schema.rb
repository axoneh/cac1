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

ActiveRecord::Schema.define(version: 20150612234157) do

  create_table "antics", force: :cascade do |t|
    t.string  "nombre",       limit: 45
    t.string  "presentacion", limit: 45
    t.boolean "requiere_inr", limit: 1
  end

  create_table "home_answers", force: :cascade do |t|
    t.integer "user_id",         limit: 4,   null: false
    t.integer "home_visit_id",   limit: 4,   null: false
    t.string  "analisis",        limit: 255
    t.string  "plan",            limit: 255
    t.integer "prescription_id", limit: 4
  end

  add_index "home_answers", ["home_visit_id"], name: "home_visit_id_idx", using: :btree
  add_index "home_answers", ["prescription_id"], name: "prescription_id_idx", using: :btree
  add_index "home_answers", ["user_id"], name: "account_id_idx", using: :btree

  create_table "home_visits", force: :cascade do |t|
    t.integer  "patient_id",             limit: 4,                           null: false
    t.integer  "user_id",                limit: 4,                           null: false
    t.datetime "fechahora"
    t.boolean  "ha_tomado_nuevos_farma", limit: 1
    t.boolean  "esta_adherido",          limit: 1
    t.boolean  "ha_dejado_tomar",        limit: 1
    t.boolean  "aumento_verdes",         limit: 1
    t.boolean  "intesta_alcohol_last",   limit: 1
    t.boolean  "sangrado_nariz",         limit: 1
    t.boolean  "ojo_hematico",           limit: 1
    t.boolean  "sangrado_oral",          limit: 1
    t.boolean  "cambio_color_piel",      limit: 1
    t.boolean  "color_deposiciones",     limit: 1
    t.boolean  "hematuria",              limit: 1
    t.decimal  "inr_domicilio",                      precision: 2, scale: 1
    t.string   "obs",                    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "home_visits", ["patient_id"], name: "idPaciente_idx", using: :btree
  add_index "home_visits", ["user_id"], name: "idCuenta_idx", using: :btree

  create_table "labs", force: :cascade do |t|
    t.integer "patient_id", limit: 4,  null: false
    t.date    "fecha"
    t.string  "estudio",    limit: 45
    t.string  "resultado",  limit: 19
    t.string  "obs",        limit: 45
  end

  add_index "labs", ["patient_id"], name: "patient_id_idx", using: :btree

  create_table "old_clabs", force: :cascade do |t|
    t.integer "patient_id", limit: 4,   null: false
    t.date    "fecha"
    t.string  "dosis",      limit: 140
    t.string  "inr",        limit: 45
    t.integer "antic_id",   limit: 4
  end

  add_index "old_clabs", ["antic_id"], name: "old_clabs_antic_id_idx", using: :btree
  add_index "old_clabs", ["patient_id"], name: "idPaciente_idx", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string  "nombre",                limit: 45
    t.string  "apellido",              limit: 45
    t.boolean "genero",                limit: 1
    t.string  "direccion",             limit: 45
    t.integer "gps",                   limit: 4
    t.integer "estadocivil",           limit: 4
    t.date    "nacimiento"
    t.string  "ocupacion",             limit: 45
    t.integer "patologia",             limit: 4
    t.string  "resumen_patologia",     limit: 255
    t.string  "antecedentes",          limit: 500
    t.boolean "altoconsumok",          limit: 1
    t.string  "alimentaciontxt",       limit: 255
    t.boolean "alcohol",               limit: 1
    t.string  "alcohol_text",          limit: 45
    t.boolean "icc",                   limit: 1
    t.boolean "diabetes",              limit: 1
    t.boolean "antecedentetrombotico", limit: 1
    t.boolean "enf_vascular",          limit: 1
    t.boolean "alteracion_renal",      limit: 1
    t.boolean "alteracion_hepatico",   limit: 1
    t.boolean "iner_dificil",          limit: 1
    t.boolean "farmacos_interactivos", limit: 1
    t.boolean "ecv_trombotico",        limit: 1
    t.boolean "ecv_hemorragico",       limit: 1
    t.boolean "otras_hemorragias",     limit: 1
    t.boolean "tao_warfarina",         limit: 1
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,                           null: false
    t.integer  "antic_id",   limit: 4
    t.string   "dosis",      limit: 140
    t.decimal  "lun",                    precision: 1, scale: 1
    t.decimal  "mar",                    precision: 1, scale: 1
    t.decimal  "mie",                    precision: 1, scale: 1
    t.decimal  "jue",                    precision: 1, scale: 1
    t.decimal  "vie",                    precision: 1, scale: 1
    t.decimal  "sab",                    precision: 1, scale: 1
    t.decimal  "dom",                    precision: 1, scale: 1
    t.string   "obs",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prescriptions", ["antic_id"], name: "prescriptions_antic_id_idx", using: :btree
  add_index "prescriptions", ["user_id"], name: "account_id_idx", using: :btree

  create_table "presential_events", force: :cascade do |t|
    t.integer  "patient_id",            limit: 4,    null: false
    t.integer  "user_id",               limit: 4,    null: false
    t.datetime "fecha"
    t.string   "subjetivo",             limit: 1000
    t.string   "objetivo",              limit: 1000
    t.boolean  "tao_indefinido",        limit: 1
    t.integer  "tao_semanas",           limit: 4
    t.integer  "dias_control_prox_inr", limit: 4
    t.boolean  "requiere_k",            limit: 1
    t.boolean  "requiere_urg",          limit: 1
    t.string   "analisis",              limit: 255
    t.string   "plan",                  limit: 500
    t.datetime "updated_at"
    t.datetime "created_at"
    t.integer  "prescription_id",       limit: 4
  end

  add_index "presential_events", ["patient_id"], name: "idPaciente_idx", using: :btree
  add_index "presential_events", ["prescription_id"], name: "prescription_id_idx", using: :btree
  add_index "presential_events", ["user_id"], name: "idCuenta_idx", using: :btree

  create_table "pruebas_modelos", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rols", force: :cascade do |t|
    t.string "NombreRol", limit: 45
  end

  create_table "rols_relations", force: :cascade do |t|
    t.integer "account_id", limit: 4, null: false
    t.integer "rol_id",     limit: 4, null: false
  end

  add_index "rols_relations", ["account_id"], name: "idCuentas_idx", using: :btree
  add_index "rols_relations", ["rol_id"], name: "idRol_idx", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nombre",          limit: 45
    t.string   "apellidos",       limit: 45
    t.datetime "fechanacimiento"
    t.string   "password",        limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid",             limit: 255
    t.string   "token",           limit: 255
    t.datetime "expires_at"
  end

end
