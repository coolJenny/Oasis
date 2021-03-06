class InternalapController < ApplicationController

  before_action :set_internal, only: [:show, :edit, :update, :destroy]

  def new
	  @description = Description.find(params[:id])

	  if @description.internal.nil?
	    @internal = Internal.new
	  else
	    respond_to do |format|
	     format.html { redirect_to "#{description_path}#internal", notice: 'External record is already present' }
	    end
	  end
	  authorize! :create, @description.internal
  end

  def show
  end

  def edit
      @description = Description.find(params[:id])
      @internal = @description.internal
      authorize! :update, @description.internal
  end

  def create
    @description = Description.find(params[:id])
    @description.internal = Internal.new(internal_params)
    authorize! :create, @description.internal

    respond_to do |format|
      if @description.internal.save 
	format.html { redirect_to "#{description_path}#internalap", notice: 'Patients exteral data is successfully created.' }
	format.json { render :show, status: :ok, location: @description.internal}
      else
        format.html { render :new }
        format.json { render json: @description.internal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :create, @description.internal
    respond_to do |format|
      if @description.internal.update(internal_params)
        format.html { redirect_to "#{description_path}#internalap", notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @description.internal }
      else
        format.html { render :edit }
        format.json { render json: @description.internal.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal
      @description = Description.find(params[:id])
      @internal = @description.internal
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_params
      params.require(:internal).permit(:accessory_spleens, :accessory_spleens_specify, :ampulla, :ampulla_specify, :bile, :bile_ducts, :bile_ducts_specify, :bile_specify, :bladder_and_urethra_normal, :bladder_and_urethra_other, :bladder_contents, :bladder_contents_specify, :capsular_surface, :capsular_surface_specify, :cut_surface, :cut_surface_specify, :ducts, :ducts_specify, :epididymis, :epididymis_specify, :female_genetalia_other, :fluid, :fluid_quantity, :gallbladder, :gallbladder_specify, :hilar_vessels_portal_vein_hepatic_artery, :hilar_vessels_portal_vein_hepatic_artery_specify, :internal_genitalia_female_normal, :internal_genitalia_male_normal, :large_instestine_normal, :large_intestine_contents, :large_intestine_mesentery, :large_intestine_mesentery_specify, :large_intestine_mucosa_and_wall, :large_intestine_mucosa_and_wall_specify, :large_intestine_other, :large_intestine_size_position_configuration, :large_intestine_size_position_configuration_specify, :large_intestine_state_of_distension, :large_intestine_state_of_distension_specify, :left_adrenal_cortex, :left_adrenal_cortex_specify, :left_adrenal_fetal_cortex, :left_adrenal_fetal_cortex_specify, :left_adrenal_gland_external_surface, :left_adrenal_gland_external_surface_specify, :left_adrenal_gland_normal, :left_adrenal_gland_parenchyma_or_cut_surface, :left_adrenal_gland_parenchyma_or_cut_surface_specify, :left_adrenal_gland_weight, :left_adrenal_medulla, :left_adrenal_medulla_specify, :left_adrenal_other, :left_adrenal_pos_config_shape, :left_adrenal_pos_config_shape_specify, :left_fallopian_tube, :left_fallopian_tube_specify, :left_kideny_peripelvic_fat_and_lymph_nodes, :left_kideny_peripelvic_fat_and_lymph_nodes_specify, :left_kidney_and_ureter_normal, :left_kidney_configuration_position, :left_kidney_configuration_position_specify, :left_kidney_cortical_thickness, :left_kidney_external_surface, :left_kidney_external_surface_specify, :left_kidney_medulla_depth, :left_kidney_other, :left_kidney_parenchyma_or_cut_surface, :left_kidney_parenchyma_or_cut_surface_specify, :left_kidney_pelves_and_calyces, :left_kidney_pelves_and_calyces_specify, :left_kidney_ureter, :left_kidney_ureter_specify, :left_kidney_weight, :left_ovary, :left_ovary_specify, :left_panel_renal_vessels, :left_panel_renal_vessels_specify, :liver_and_biiary_system_other, :liver_and_biliary_system_normal, :liver_and_billiary_system_external_surface, :liver_and_billiary_system_external_surface_specify, :liver_size_shape, :liver_size_shape_specify, :liver_weight, :male_genetalia_other, :meckel_diverticulum, :meckel_diverticulum_specify, :no_of_umbilical_arteries, :pancreas_external_surface, :pancreas_external_surface_specify, :pancreas_normal, :pancreas_other, :pancreas_parenchyma_or_cut_surface, :pancreas_parenchyma_or_cut_surface_specify, :pancreas_size_configuration, :pancreas_size_configuration_specify, :pancreas_weight, :peritoneal_cavity_normal, :peritoneal_cavity_organ_relations, :peritoneal_cavity_organ_relations_specify, :peritoneal_cavity_other, :peritoneal_nature_of_fluid, :peritoneal_nature_of_fluid_specify, :peritoneal_serosal_surfaces, :peritoneal_serosal_surfaces_specify, :perivesical_tissue, :perivesical_tissue_specify, :prostate, :prostate_specify, :retrroperitoneum, :retrroperitoneum_specify, :right_adrenal_cortex, :right_adrenal_cortex_specify, :right_adrenal_fetal_cortex, :right_adrenal_fetal_cortex_specify, :right_adrenal_gland_external_surface, :right_adrenal_gland_external_surface_specify, :right_adrenal_gland_normal, :right_adrenal_gland_parenchyma_or_cut_surface, :right_adrenal_gland_parenchyma_or_cut_surface_specify, :right_adrenal_gland_weight, :right_adrenal_medulla, :right_adrenal_medulla_specify, :right_adrenal_other, :right_adrenal_pos_config_shape, :right_adrenal_pos_config_shape_specify, :right_fallopian_tubes, :right_fallopian_tubes_specify, :right_kidney_and_ureter_normal, :right_kidney_configuration_position, :right_kidney_configuration_position_specify, :right_kidney_cortical_thickness, :right_kidney_cut_surface, :right_kidney_cut_surface_specify, :right_kidney_external_surface, :right_kidney_external_surface_specify, :right_kidney_medulla_depth, :right_kidney_other, :right_kidney_pelves_and_calyces, :right_kidney_pelves_and_calyces_specify, :right_kidney_peripelvic_fat_and_lymph_nodes, :right_kidney_peripelvic_fat_and_lymph_nodes_specify, :right_kidney_renal_vessels, :right_kidney_renal_vessels_specify, :right_kidney_ureter, :right_kidney_ureter_specify, :right_kidney_weight, :right_ovary, :right_ovary_specify, :size_and_configuration, :size_and_configuration_specify, :small_intestine_contents, :small_intestine_mesentery, :small_intestine_mesentery_specify, :small_intestine_mucosa_and_wall, :small_intestine_mucosa_and_wall_specify, :small_intestine_normal, :small_intestine_other, :small_intestine_size_position_configuration, :small_intestine_size_position_configuration_specify, :small_intestine_state_of_distension, :small_intestine_state_of_distension_specify, :spleen_consistency, :spleen_consistency_specify, :spleen_cut_surface, :spleen_cut_surface_specify, :spleen_normal, :spleen_shape_position_configuration, :spleen_shape_position_configuration_specify, :spleen_weight, :stomach_and_duodenum_contents, :stomach_and_duodenum_normal, :stomach_and_duodenum_other, :stomach_mucosa_and_wall, :stomach_mucosa_and_wall_specify, :stomach_size_position_configuration, :stomach_size_position_configuration_specify, :stones, :stones_specify, :testes, :testes_specify, :umbilical_vessels, :umbilical_vessels_specify, :urethra, :urethra_specify, :uterus, :uterus_specify, :vagina, :vagina_specify, :wall_and_mucosa, :wall_and_mucosa_specify, :description ) 
    end
end
