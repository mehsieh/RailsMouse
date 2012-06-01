class CreateSnpPositions < ActiveRecord::Migration
  def change
    create_table :snp_positions do |t|
      t.string :snp_id
      t.integer :position
      t.integer :chromosome

      t.timestamps
    end
    
    add_index :snp_positions, :chromosome
  end
end
