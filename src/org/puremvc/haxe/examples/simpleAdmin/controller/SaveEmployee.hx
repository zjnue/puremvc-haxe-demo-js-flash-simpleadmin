/* 
 PureMVC haXe Demo -  JavaScript / Flash Simple Admin
 By Marco Secchi <marco.secchi@puremvc.org>
 Copyright(c) 2008 Marco Secchi, Some rights reserved.
 */
package org.puremvc.haxe.examples.simpleAdmin.controller;

import org.puremvc.haxe.examples.simpleAdmin.SimpleAdminFacade;
import org.puremvc.haxe.examples.simpleAdmin.model.EmployeesProxy;
import org.puremvc.haxe.examples.simpleAdmin.view.DetailsMediator;
import org.puremvc.haxe.examples.simpleAdmin.ui.IDetails;

import org.puremvc.haxe.patterns.command.SimpleCommand;
import org.puremvc.haxe.interfaces.INotification;

class SaveEmployee extends SimpleCommand
{


	/**
	 * Saves the employee data, retrieving it from the details mediator
	 * ad sends a notification to all observer to update data
	 */
	override public function execute( note: INotification ): Void
	{
		var proxy = cast( facade.retrieveProxy( EmployeesProxy.NAME ), EmployeesProxy );
		var mediator = cast( facade.retrieveMediator( DetailsMediator.NAME ), DetailsMediator );
		proxy.saveEmployee( mediator.getEmployeeDetails() );
		
		sendNotification( SimpleAdminFacade.UPDATE_LIST );
	}
}