//
//  HomeView.swift
//  Markit
//
//  Created by Zayn on 4/3/22.
//

import SwiftUI

struct HomeView: View {
	
	@StateObject var vm = HomeViewModal()
	
	var body: some View {
		ZStack {
			
			ZStack {
				HStack {
					Text("Markit.")
						.padding(.vertical, 5)
						.padding(.horizontal, 15)
						.font(.system(size: 30, weight: .heavy, design: .rounded))
						.foregroundColor(Color(.systemGray))
						.background(Color(.systemGray6))
						.cornerRadius(100)
						.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
					Spacer()
				}
				.padding(.horizontal)
				
			}
			.padding(.vertical, 10)
			
			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
			.zIndex(100)
			
			
			ZStack {
				
				
				ScrollView(.vertical) {
					VStack {
						HStack {
							Text("Pinned")
								.font(.system(size: 20, weight: .heavy, design: .rounded))
							Spacer()
							
						}
						.padding(.horizontal)
						
						VStack {
							ForEach(vm.savedIn.filter{ $0.isPinned == true }) { saved in
								
								TodoViewCell(vm: vm, saved: saved)
							}
							
						}
						.padding(.vertical, 1)
					}
					
					VStack {
						HStack {
							Text("Recent")
								.font(.system(size: 20, weight: .heavy, design: .rounded))
							Spacer()
						}
						.padding(.horizontal)
						VStack {
							if vm.savedIn.isEmpty {
								VStack {
									Spacer()
									Image(systemName: "face.smiling")
										.font(.system(size: 90)).padding(5)
									Text("You're All Cought Up")
										.font(.system(size: 20, weight: .bold, design: .rounded))
								}
								.foregroundColor(Color.pink)
							} else {
								ForEach(vm.savedIn.filter{ $0.isPinned == false }) { saved in
									TodoViewCell(vm: vm, saved: saved)
								}
							}
						}
					}
				}
				.zIndex(-1)
				.padding(.top, 120)
				
				
				
				ZStack {
					Button(action: {
						vm.addSheet.toggle()
					}){
						Image(systemName: "plus.circle")
							.padding()
							.foregroundColor(Color.white)
							.font(.system(size: 25))
						
					}
					.foregroundColor(Color.primary)
					.padding(0)
					.background(Color.pink)
					.cornerRadius(100)
					.padding()
					
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
				
				
			}
			.background(Color.secondary.opacity(0.0))
			.fullScreenCover(isPresented: $vm.addSheet) {
				AddNewView(vm: vm)
			}
			.edgesIgnoringSafeArea(.all)
			.navigationBarTitle("Makeit")
		
		
		}
		
		
		
	}
}


struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView(vm: HomeViewModal())
	}
}
