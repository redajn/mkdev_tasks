ActiveRecord::Schema.define(version: 2020_03_13_101212) do

  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "location"
    t.datetime "starttime"
    t.datetime "endtime"
    t.string "organizeremail"
    t.string "organizertelegram"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
