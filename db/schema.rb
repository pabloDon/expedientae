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

ActiveRecord::Schema.define(version: 20141129134009) do

  create_table "proceedings", force: true do |t|
    t.string   "numExpediente"
    t.string   "nombre"
    t.string   "apellidos"
    t.integer  "edad"
    t.boolean  "sexo"
    t.string   "dni"
    t.integer  "asunto"
    t.date     "fecha_despido"
    t.date     "fecha_conciliacion"
    t.boolean  "conciliacion"
    t.string   "juzgado_numero"
    t.date     "fecha_juicio"
    t.string   "demanda_numero"
    t.date     "fecha_sentencia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "acuerdo"
    t.string   "finiquito"
    t.string   "carta_despido"
    t.string   "cedula_citacion"
    t.string   "demanda"
    t.string   "sentencia"
  end

end
