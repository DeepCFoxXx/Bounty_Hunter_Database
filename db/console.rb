require_relative('../models/bounty.rb')

Bounty.delete_all()

bounty1 = Bounty.new({
  'name' => 'Boba Fett',
  'bounty_value' => 9000,
  'danger_level' => 'High',
  'last_known_location' => 'Kamino'
  })
  bounty1.save()

  bounty2 = Bounty.new({
    'name' => 'IG88',
    'bounty_value' => 5000,
    'danger_level' => 'Medium',
    'last_known_location' => 'Halowan'
    })
    bounty2.save()

    bounty3 = Bounty.new({
      'name' => 'Dengar',
      'bounty_value' => 2000,
      'danger_level' => 'Low',
      'last_known_location' => 'Corellia'
      })
      bounty3.save()
