# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

t = Team.create(name:'No Team', description:'If you are not sure.')
User.create(email:'fbirc-dev@neura.edu.au', password:'password', full_name:'FBIRC-Dev (Root Account)', contact_number:'0', team_id: t.id, isApproved: true, isAdmin: true, isActive: true, isBlinded: false, isSupervisor: false)

s = Study.create(study_name:'No Study', description:'All participants are to be moved out of this study except for the participant called ToDo which is a dummy participant')
p = Participant.create(title:'Dr', first_name:'To', surname: 'Do', preferred_name: 'Work Work Work Work', gender:3, date_of_birth:Date.today, email:'fbirc-dev@neura.edu.au', study_id: s.id, status: 2, primary_contact_number:'02 9399 1873', home_address_line_1:'Neuroscience Research Australia', home_address_line_2:'139 Barker Street', home_address_suburb:'Randwick', home_address_state:'NSW', home_address_postcode:'2031')
