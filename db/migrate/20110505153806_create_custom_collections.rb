#encoding: utf-8
class CreateCustomCollections < ActiveRecord::Migration
  def self.up
    create_table :custom_collections do |t|
      t.integer :shop_id, comment: '所属网店'
      t.string :title, comment: '标题'
      t.boolean :published, comment: '是否可见', default: true
      t.string :handle, comment: '用于模板中的Permalink/Handle', null: false
      t.text :body_html, comment: '内容'
      t.string :products_order, comment: '归属商品的排序'

      t.timestamps
    end

    create_table :custom_collection_products do |t|
      t.integer :custom_collection_id, comment: '所属集合'
      t.integer :product_id, comment: '关联商品'
      t.integer :position, comment: '排序序号'

      t.timestamps
    end

    add_index :custom_collections        , :shop_id
    add_index :custom_collection_products, :custom_collection_id
  end

  def self.down
    drop_table :custom_collection_products
    drop_table :custom_collections
  end
end
