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

ActiveRecord::Schema.define(version: 20140104223442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "perfils", force: true do |t|
    t.string   "prf_nombre"
    t.string   "prf_descripcion"
    t.string   "prf_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "usuarios", ["perfil_id"], name: "index_usuarios_on_perfil_id", using: :btree

end
