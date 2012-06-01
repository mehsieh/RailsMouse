class CreateStrains < ActiveRecord::Migration
  def change
    create_table :strains do |t|
      t.string :name
      t.integer :snp_position_id
      t.text :allele

      t.timestamps
    end
    add index :strains, :snp_position_id
  end
end
