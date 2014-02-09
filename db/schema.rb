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

ActiveRecord::Schema.define(version: 20140208233708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accions", force: true do |t|
    t.string   "acc_codigo"
    t.string   "acc_nombre"
    t.string   "acc_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogos", force: true do |t|
    t.string   "ctlg_categoria"
    t.string   "ctlg_subcategoria"
    t.string   "ctlg_valor_cdg"
    t.string   "ctlg_valor_desc"
    t.string   "ctlg_observacion"
    t.string   "ctlg_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "controls", force: true do |t|
    t.string   "ctrl_descripcion"
    t.string   "ctrl_html_id"
    t.string   "ctrl_tipo"
    t.integer  "modelo_id"
    t.integer  "accion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "controls", ["accion_id"], name: "index_controls_on_accion_id", using: :btree
  add_index "controls", ["modelo_id"], name: "index_controls_on_modelo_id", using: :btree

  create_table "modelos", force: true do |t|
    t.string   "mdl_codigo"
    t.string   "mdl_nombre"
    t.string   "mdl_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfils", force: true do |t|
    t.string   "prf_nombre"
    t.string   "prf_descripcion"
    t.string   "prf_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "prf_tipo_perfil"
  end

  create_table "usuarios", force: true do |t|
    t.string   "usr_tipo_docum_ident"
    t.integer  "usr_nro_docum_ident"
    t.string   "usr_nombres"
    t.string   "usr_apellidos"
    t.string   "usr_correo_electronico"
    t.string   "usr_contrasena"
    t.string   "usr_tipo_contrasena"
    t.date     "usr_fecha_nacimiento"
    t.string   "usr_genero"
    t.binary   "usr_foto"
    t.datetime "usr_fch_ultimo_ingreso"
    t.string   "usr_tipo_cliente"
    t.datetime "usr_fecha_ultima_salida"
    t.date     "usr_fch_vigencia_contrasena"
    t.string   "usr_estado"
    t.integer  "perfil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "usr_salt"
  end

  add_index "usuarios", ["perfil_id"], name: "index_usuarios_on_perfil_id", using: :btree
  add_index "usuarios", ["usr_apellidos"], name: "index_usuarios_on_usr_apellidos", using: :btree
  add_index "usuarios", ["usr_correo_electronico"], name: "index_usuarios_on_usr_correo_electronico", unique: true, using: :btree
  add_index "usuarios", ["usr_nombres"], name: "index_usuarios_on_usr_nombres", using: :btree
  add_index "usuarios", ["usr_nro_docum_ident"], name: "index_usuarios_on_usr_nro_docum_ident", unique: true, using: :btree

end
