component {
    this.title 	= "contentbox-ckeditor-btgrid";
    this.name = "contentbox-ckeditor-btgrid";
    this.author = "";
    this.description 		= "Add btgrid plugin to ckeditor in ContentBox 3.5+";
    this.version			= "1.1.0";
    this.entryPoint			= "contentbox-ckeditor-btgrid";
    this.webUrl = "https://github.com/BluewaterSolutions/contentbox-ckeditor-btgrid";

    function configure() {
        //
        binder.map("fileUtils@contentboxckeditorbtgrid").to("coldbox.system.core.util.FileUtils");
    }

    /**
	* CKEditor Integrations
	*/
	function cbadmin_ckeditorExtraPlugins(event, interceptData){
		arrayAppend( arguments.interceptData.extraPlugins, "btgrid" );
	}

	/**
	* CKEditor Integrations
	*/
	function cbadmin_ckeditorToolbar(event, interceptData){
		var itemLen = arrayLen( arguments.interceptData.toolbar );
		for( var x =1; x lte itemLen; x++ ){
			if( isStruct(arguments.interceptData.toolbar[x])
			    AND arguments.interceptData.toolbar[x].name eq "contentbox" ){
				arrayAppend( arguments.interceptData.toolbar[x].items, "btgrid");
				break;
			}
		}
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// Let's add ourselves to the main menu in the Modules section

	}

	/**
	* Fired when the module is activated
	*/
	function onActivate(){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");

		// Install the ckeditor plugin
		var contentboxckeditorbtgridPath = controller.getSetting( "modules" )[ "contentbox-admin" ].path & "/modules/contentbox-admin/modules/contentbox-ckeditor/includes/ckeditor/plugins/btgrid";
		var fileUtils = controller.getWireBox().getInstance("fileUtils@contentboxckeditorbtgrid");
		var pluginPath = controller.getSetting("modules")[ "contentbox-ckeditor-btgrid" ].path & "/includes/btgrid";
		fileUtils.directoryCopy(source=pluginPath, destination=contentboxckeditorbtgridPath);
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		// Let's remove ourselves to the main menu in the Modules section

	}

	/**
	* Fired when the module is deactivated by ContentBox Only
	*/
	function onDeactivate(){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		// Uninstall the ckeditor plugin
		var contentboxckeditorbtgridPath = controller.getSetting( "modules" )[ "contentbox-admin" ].path & "/modules/contentbox-admin/modules/contentbox-ckeditor/includes/ckeditor/plugins/btgrid";
		var fileUtils = controller.getWireBox().getInstance("fileUtils@contentboxckeditorbtgrid");
		var pluginPath = controller.getSetting("modules")["contentbox-ckeditor-btgrid"].path & "/includes/btgrid";
		try{
			fileUtils.directoryRemove(path=contentboxckeditorbtgridPath, recurse=true);
		}
		catch {

		}
		
	}
}