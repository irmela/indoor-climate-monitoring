FactoryBot.define do
  factory :measurement do
    timestamp_day '2018-01-23'
    location 'living_room'
    results do
      {
        '0' => {
          '0' => { 'temperature' => 18.8, 'humidity' => 64.3 },
          '1' => { 'temperature' => 19.3, 'humidity' => 65.1 },
          '2' => { 'temperature' => 19.2, 'humidity' => 65.9 }
        }
      }
    end
  end
end
