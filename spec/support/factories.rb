FactoryGirl.define do


  factory :job do 
    sequence :title do |n|
        "example_title_" + n.to_s
    end
    level_of_interest 97
    city "Boulder"
    company
    category {FactoryGirl.create(:category)}
  end

  factory :company do
    sequence :name do |n|
      "example_name_" + n.to_s
    end

    factory :company_with_jobs do
      after(:create) do |company|
        create_list(:job, 10, company: company)
      end
    end
  
  end

  factory :category do
    sequence :title do |n|
      "example_title_" + n.to_s
    end

    factory :category_with_jobs do
      after(:create) do |category|
        create_list(:job, 10, category: category)
      end
    end
  end

end