// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.
import {
  ManagementGroup,
  ManagementGroupsAPI,
} from "@azure/arm-managementgroups";
import { DefaultAzureCredential } from "@azure/identity";
import {
  AzExtParentTreeItem,
  AzExtTreeItem,
} from "@microsoft/vscode-azext-utils";

import { localize } from "../../utils/localize";
import { GenericAzExtTreeItem } from "./GenericAzExtTreeItem";

export class AzManagementGroupTreeItem extends AzExtParentTreeItem {
  public readonly childTypeLabel = localize(
    "managementGroup",
    "Management Group"
  );
  public contextValue = "managementGroup";
  public label: string = this.childTypeLabel;

  constructor() {
    super(undefined);
  }

  public async loadMoreChildrenImpl(): Promise<AzExtTreeItem[]> {
    const managementGroupsAPI = new ManagementGroupsAPI(
      new DefaultAzureCredential()
    );
    const managementGroups = await managementGroupsAPI.managementGroups.list();
    const managementGroupsArray: ManagementGroup[] = [];

    for await (const managementGroup of managementGroups) {
      managementGroupsArray.push(managementGroup);
    }

    return await this.createTreeItemsWithErrorHandling(
      managementGroupsArray,
      "invalidManagementGroup",
      (mg) => new GenericAzExtTreeItem(this, mg.id, mg.name),
      (mg) => mg.name
    );
  }

  public hasMoreChildrenImpl(): boolean {
    return false;
  }
}
