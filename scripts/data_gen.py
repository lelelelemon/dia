# compare the main feature of 3 files
import os
import math
from collections import OrderedDict
import sys
def processFile(filename):
	array = []
	controller = {}
	with open(filename) as f:
		for line in f:
			array.append(line)
	for l in array:
		line_array = l.split(' ');
		if( ('Controller' in l) and ('render_template_time' in l) and len(line_array) == 9 and line_array[0] != 'query' and len(line_array[0].split('.')) == 2 and line_array[1].startswith('total_duration')):
			break_hash = {}
			for breakdown in line_array:
				break_array = breakdown.split('=')
				break_hash['size'] = float(1);
				if(len(break_array) == 2):
					if(break_array[1]):
						break_hash[break_array[0]] = float(break_array[1])
					else:
						break_hash[break_array[0]] = float(0)
			if line_array[0] in controller.keys():
				already_hash = controller[line_array[0]]
				for keys in already_hash:
					already_hash[keys] += break_hash[keys]
			else:
				controller[line_array[0]] = break_hash
	#for keys in controller:
		#print keys,
		#dic = controller[keys]
		#for k in dic:
			#print dic[k]/dic['size'],
		#print ''
	return controller
def processDir(dir):
	files = os.listdir(dir)
	f_100M = dir + "20000.log"
	f_10M = dir + "2000.log"
	f_1M = dir + "200.log"
	print f_100M, f_10M, f_1M
	process3Dir(f_100M, f_10M, f_1M)

def process3Dir(dir1, dir2,dir3):
		controller1 = processFile(dir1)
		controller2 = processFile(dir2)
		controller3 = processFile(dir3)
		d_descending = OrderedDict(sorted(controller1.items(), 
                                  key=lambda kv: kv[1]['total_duration']/kv[1]['size'], reverse=True))
		count = 0;
		for keys in d_descending:
			
			dic = controller1[keys]

			if keys in controller2 and keys in controller3 :
				count = count + 1
				dic2 = controller2[keys]
				dic3 = controller3[keys]
				#for k in dic:
				#	print dic[k]/dic['size'],  dic2[k]/dic2['size'],	
				total_duration1 = dic['total_duration']/dic['size']
				total_duration2 = dic2['total_duration']/dic2['size']
				total_duration3 = dic3['total_duration']/dic3['size']
				query_time1 = (dic['query_time']/dic['size'])
				query_time2 = dic2['query_time']/dic2['size']
				query_time3 = dic3['query_time']/dic3['size']
				render_time1 = (dic['render_template_time']/dic['size'])
				render_time2 = dic2['render_template_time']/dic2['size']
				render_time3 = dic3['render_template_time']/dic3['size']
				other_time1 = (dic['total_duration'] - dic['db_time'] - dic['render_template_time'])/dic['size']
				other_time2 = (dic2['total_duration'] - dic2['db_time'] - dic2['render_template_time'])/dic2['size']
				other_time3 = (dic3['total_duration'] - dic3['db_time'] - dic3['render_template_time'])/dic3['size']
				if other_time1 < 0: 
					other_time1 = 0
				if other_time2 < 0:
					other_time2 = 0
				if other_time3 < 0:
					other_time3 = 0
				#print total_duration1
				output3 = keys + ' 10M ' + str(query_time3) +' ' + str(render_time3) +' ' + str(other_time3)+'\n'
				output2 = keys + ' 100M ' + str(query_time2) +' ' + str(render_time2) +' ' + str(other_time2)+'\n'
				output1 = keys +' ' +  '1000M' +' ' +  str(query_time1) +' ' + str(render_time1) +' ' + str(other_time1)+'\n'
				output0 = keys +' ' +  '0 0 0 0\n'
				print keys,
				print total_duration3,total_duration2, total_duration1,	
				print query_time3,query_time2,query_time1,
				print render_time3,render_time2,render_time1,
				print other_time3,other_time2,other_time1,
					
				#data_file.write(output3)
				#data_file.write(output2)
				#data_file.write(output1)
				#data_file.write(output0)
				#data_file.close()
				print ''			
			#else:
			#	for k in dic:
			#		print dic[k]/dic['size'], float(0),
		#print ''		
def main():
	processDir(sys.argv[1])

if __name__=="__main__":
	main()
