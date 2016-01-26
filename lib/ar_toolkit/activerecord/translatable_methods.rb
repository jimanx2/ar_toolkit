module ArToolkit
  module ActiveRecord
    module TranslatableMethods
      def self.included base
        base.class_eval do 
          column_names.each do |col|
            next if col.match(/id|created_at|updated_at/)
            
            define_method "#{col}=" do |val|
              t = Translatable.find_by(:locale => I18n.locale.to_s, :model_id => __model_id, :field => col)
              
              if I18n.locale != I18n.default_locale
                if t.present?
                  t.value = val
                  t.save!
                else
                  t = Translatable.create({
                    locale: I18n.locale.to_s, 
                    model_id: __model_id, 
                    field: col, 
                    value: val
                  })
                end
                
                return t.value
              else
                self[col.to_sym] = val
                save!
                return self[col.to_sym]
              end
            end
          end
        end
      end
      
      def t field, locale=nil, newval=nil
        t = translation.find_by(
          locale: locale || I18n.locale, 
          field: field
        )
        
        if newval.present?
          if t.nil?
            t = Translatable.new({
              model_id: __model_id, locale: locale, field: field
            })
          end
          t.value = newval
          t.save!
        end
        
        t.nil? ? self[field.to_sym] : t.value
      end
      
      private
      def __model_id
        model_id = "#{self.class.name}#{self.id}"
          .each_byte.map{|b| b }.inject{|sum,x| sum + x }
      end

      private
      def translation
        translated = Translatable.where(
          :model_id => __model_id
        )
        return translated ? translated : nil
      end
      
    end
  end
end