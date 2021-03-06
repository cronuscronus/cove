Factory.define :job do |f|
	f.budget 100
	f.spent 0
	f.active true
	f.description "Find all instances of riffing in days 1-5"
	f.videos { [Factory(:video)] }
	f.tags { [ Factory(:tag)] }
	f.requestor { User.first }
end

Factory.define :job_video do |f|
	f.video_id do
		Video.first ? Video.first : Factory(:video)
	end
	f.job_id do
		Job.first ? Job.first : Factory(:job)
	end
end

Factory.define :job_code do |f|
	f.tag_id do
		Tag.first ? Tag.first : Factory(:tag)
	end
	f.job_id do
		Job.first ? Job.first : Factory(:job)
	end
end
